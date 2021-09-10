//
//  ConferenceData.swift
//
//  Created by Chris Price on 18/06/2021.
//

import Foundation

private let _hiddenSharedInstance = ConferenceData()

class ConferenceData{
    
    class var sharedInstance: ConferenceData{
        return _hiddenSharedInstance;
    }
    
    var allTalks: [Talk] = []
    var allSpeakers: [Speaker] = []
    var allLocations: [Location] = []
    
    var favourites: [String] = []
    
    init(){
        loadAllConfInfo()
        
        loadFavourites();
    }
    
    func loadAllConfInfo() {
        // Loads all info from a JSON file in the Bundle and puts it in three arrays
        let urlPath = Bundle.main.url(forResource: "confinfo", withExtension: "json")
        if let path = urlPath {
           if let dataFromFile = try? Data(contentsOf: path) {
               // Decode the json back to state of program
               let decoder = JSONDecoder()
               if let confInfo = try? decoder.decode(ConfInfo.self, from: dataFromFile) {
                  allTalks = confInfo.talks
                  allSpeakers = confInfo.speakers
                  allLocations = confInfo.locations
               }
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
    let version: Int
    let speakers: [Speaker]
    let locations: [Location]
    let talks: [Talk]
}
