//
//  ConferenceData.swift
//
//  Created by Chris Price on 18/06/2021.
//

import Foundation
import Firebase

private let _hiddenSharedInstance = ConferenceData()

class ConferenceData{
    
    class var sharedInstance: ConferenceData{
        return _hiddenSharedInstance;
    }
    
    var version = "0.0"
    
    var allTalks: [Talk] = []
    var allSpeakers: [Speaker] = []
    var allLocations: [Location] = []
    
    var favourites: [String] = []
    
    init(){
        loadFavourites();
    }
    
    func loadAllConfInfo(update: @escaping () -> Void) {
        // We are going to add this to get data from Firebase
        let db = Firestore.firestore()
        let docRef = db.collection("Programme").document("iOSDevUK2019")
        docRef.getDocument() { (document, error) in
            guard let document = document else {
                print("Document does not exist")
                return
            }
            guard let docData = document.data() else {
                print("Document has no data")
                return
            }
            if let readVersion = docData["version"] as? String {
                self.version = readVersion
                print( "Version is \(readVersion)")
            }
            if let encodedData = docData["contents"] as? Data {
                let decoder = JSONDecoder()
                if let confInfo = try? decoder.decode(ConfInfo.self, from: encodedData) {
                    self.allTalks = confInfo.talks
                    self.allSpeakers = confInfo.speakers
                    self.allLocations = confInfo.locations
                }
                update()
            }
        }
        
    }
    
    func loadFavourites() {
        if fileExistsInDocuments("favourites.json") {
            let readListURL =  urlToFileInDocuments("favourites.json")
            if let dataFromFile = try? Data(contentsOf: readListURL) {
                // Decode the json back to state of program
                let decoder = JSONDecoder()
                if let loadedArray = try? decoder.decode([String].self, from: dataFromFile) {
                    favourites = loadedArray
                }
            }
        } else {
            saveFavourites()
        }
    }
    
    func saveFavourites() {
        let readListURL =  urlToFileInDocuments("favourites.json")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(favourites) {
            //Write the data to backing store.
            try? data.write(to: readListURL, options: .noFileProtection)
        }
    }
    
    func speakerFromSpeakerId( speakerId: String ) -> Speaker {
        let speakers = allSpeakers.filter{$0.id == speakerId}
        if speakers.isEmpty {
            return allSpeakers[0]
        }
        return speakers[0]
    }
    
    func locationFromLocationId( locationId: String ) -> Location {
        let locations = allLocations.filter{$0.id == locationId}
        if locations.isEmpty {
            return allLocations[0]
        }
        return locations[0]
    }
    
    
    // MARK: - File handling routines
    
    func fileExistsInDocuments( _ fileName: String ) -> Bool {
        let fileManager = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        let filepathName = docsDir + "/\(fileName)"
//        print( "path is \(filepathName)")
        return fileManager.fileExists(atPath: filepathName)
    }
    
    func urlToFileInDocuments( _ fileName: String ) -> URL {
        let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = docDirectory.appendingPathComponent(fileName)
        return fileURL
    }
    
}

struct ConfInfo: Codable {
    let speakers: [Speaker]
    let locations: [Location]
    let talks: [Talk]
}

