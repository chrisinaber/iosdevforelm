//
//  ConferenceData.swift
//  ConferenceCreator
//
//  Created by Chris Price on 23/06/2021.
//

import Foundation

private let _hiddenSharedInstance = ConferenceData()

class ConferenceData{
 
    var allSpeakers: [Speaker] = []

    class var sharedInstance: ConferenceData{
        return _hiddenSharedInstance;
    }
    
    init(){
        if fileExistsInDocuments("speakers.json") {
            let readListURL =  urlToFileInDocuments("speakers.json")
            if let dataFromFile = try? Data(contentsOf: readListURL) {
                // Decode the plist back to state of program
                let decoder = JSONDecoder()
                if let loadedArray = try? decoder.decode([Speaker].self, from: dataFromFile) {
                    allSpeakers = loadedArray
                }
            }
        }
    }
    
    func addSpeaker( newSpeaker: Speaker ){
        allSpeakers.append(newSpeaker)
        saveSpeakers()
    }
    
    func saveSpeakers() {
        let readListURL =  urlToFileInDocuments("speakers.json")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(allSpeakers) {
            //Write the data to backing store.
            try? data.write(to: readListURL, options: .noFileProtection)
            print( "file is at \(readListURL)")
        }
    }
    
    func urlToFileInDocuments( _ fileName: String ) -> URL {
        let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = docDirectory.appendingPathComponent(fileName)
        return fileURL
    }
    
    func fileExistsInDocuments( _ fileName: String ) -> Bool {
        let fileManager = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        let filepathName = docsDir + "/\(fileName)"
        return fileManager.fileExists(atPath: filepathName)
    }
    
    
 }
    
