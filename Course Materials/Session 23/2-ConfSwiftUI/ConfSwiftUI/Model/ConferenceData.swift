//
//  ConferenceData.swift
//
//  Created by Chris Price on 18/06/2021.
//

import Foundation

class ConferenceData: ObservableObject{
    
    @Published var allTalks: [Talk] = []
    @Published var allSpeakers: [Speaker] = []
    @Published var allLocations: [Location] = []
    @Published var favourites: [Talk] = []
    
    let dates = [ ["Monday", "2019-12-10" ], ["Tuesday", "2019-12-11" ], ["Wednesday", "2019-12-12" ], ["Thursday", "2019-12-13" ]]
    
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
                    let favouriteIds = loadedArray
                    favourites = favouriteIds.compactMap{talkFromId(id: $0)}
                }
            }
        } else {
            saveFavourites()
        }
    }
    
    func saveFavourites() {
        let readListURL =  urlToFileInDocuments("favourites.json")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(favourites.map{$0.id}) {
            //Write the data to backing store.
            try? data.write(to: readListURL, options: .noFileProtection)
        }
    }
    
    func removeFavourite(talk: Talk) {
        favourites = favourites.filter{$0 != talk}
        saveFavourites()
    }
    
    func addFavourite(talk: Talk) {
        favourites.append(talk)
        saveFavourites()
    }
    
    func isFavourite(talk: Talk) -> Bool {
        return favourites.contains(talk)
    }
    
    func speakerFromId( id: String ) -> Speaker {
        let speakers = allSpeakers.filter{$0.id == id}
        if speakers.isEmpty {
            return allSpeakers[0]
        }
        return speakers[0]
    }
    
    func speakerNameFromId( id: String ) -> String {
        let speakers = allSpeakers.filter{$0.id == id}
        if speakers.isEmpty {
            return ""
        }
        return speakers[0].name
    }
    
    func locationNameFromId( id: String ) -> String {
        let locations = allLocations.filter{$0.id == id}
        if locations.isEmpty {
            return "None"
        }
        return locations[0].name
    }
    
    func locationFromId( id: String ) -> Location {
        let locations = allLocations.filter{$0.id == id}
        if locations.isEmpty {
            return allLocations[0]
        }
        return locations[0]
    }
    
    func talkFromId( id: String ) -> Talk? {
        let talks = allTalks.filter{$0.id == id}
        if talks.isEmpty {
            return nil
        }
        return talks[0]
    }
    
    func orderedTalksOnDate( date: String ) -> [Talk] {
        let todaysTalks = allTalks.filter{ $0.sessionDate == date}
        return todaysTalks.sorted(by: <)
    }
    
    func orderedFavouritesOnDate( date: String ) -> [Talk] {
        let todaysTalks = favourites.filter{ $0.sessionDate == date}
        return todaysTalks.sorted(by: <)
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
