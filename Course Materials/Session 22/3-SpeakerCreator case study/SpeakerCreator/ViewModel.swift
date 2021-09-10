//
//  ViewModel.swift
//  SpeakerCreator
//
//  Created by Chris Price on 08/09/2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var speakerList: SpeakerList
    
    init() {
        speakerList = SpeakerList{ViewModel.loadSpeakers()}
    }
    
    static func loadSpeakers() -> [Speaker] {
        if fileExistsInDocuments("speakers.json") {
            let readListURL =  urlToFileInDocuments("speakers.json")
            if let dataFromFile = try? Data(contentsOf: readListURL) {
                // Decode the JSON back to state of program
                let decoder = JSONDecoder()
                if let loadedArray = try? decoder.decode([Speaker].self, from: dataFromFile) {
                    return(loadedArray.sorted(by: <))
                }
            }
        }
        return []
    }
    
    static func urlToFileInDocuments( _ fileName: String ) -> URL {
        let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = docDirectory.appendingPathComponent(fileName)
        return fileURL
    }
    
    static func fileExistsInDocuments( _ fileName: String ) -> Bool {
        let fileManager = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        let filepathName = docsDir + "/\(fileName)"
        return fileManager.fileExists(atPath: filepathName)
    }
    
    func validateSpeaker( name: String, biography: String, twitter: String)  -> String {
        var result = ""
        let id = name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if id.count == 0 {
            result = "You have failed to supply a name.\n"
        }
        if biography.count == 0 {
            result = result + "You have failed to supply a biography."
        }
        if result == "" {
            addSpeaker(newSpeaker: Speaker(id: id, name: name, biography: biography, twitter: twitter))
        }
        return result
    }
    
    
    func addSpeaker( newSpeaker: Speaker ) {
        speakerList.allSpeakers.append(newSpeaker)
        saveSpeakers()
        speakerList = SpeakerList{ViewModel.loadSpeakers()}

    }
    
    func saveSpeakers() {
        let readListURL =  ViewModel.urlToFileInDocuments("speakers.json")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(speakerList.allSpeakers) {
            //Write the data to backing store.
            try? data.write(to: readListURL, options: .noFileProtection)
            print( "file is at \(readListURL)")
        }
    }
}
