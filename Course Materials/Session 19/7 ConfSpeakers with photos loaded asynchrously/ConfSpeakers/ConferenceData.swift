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
    
    var allSpeakers: [Speaker] = []
    
    init(){
        loadSpeakerInfo()
    }
    
    func loadSpeakerInfo() {
        // Loads speaker info from a JSON file in the Bundle and puts it in an array
        let urlPath = Bundle.main.url(forResource: "confinfo", withExtension: "json")
        if let path = urlPath {
            if let dataFromFile = try? Data(contentsOf: path) {
                // Decode the json back to state of program
                let decoder = JSONDecoder()
                if let speakerInfo = try? decoder.decode([Speaker].self, from: dataFromFile) {
                    allSpeakers = speakerInfo
                }
                loadSpeakerPhotos()
            }
        }
    }
    
    func loadSpeakerPhotos() {
        let accessStem = "https://github.com/chrisinaber/iosdevforelm/raw/main/Speakers/"
        for speaker in allSpeakers {
            let fileName = speaker.id + ".jpg"
            if !fileExistsInDocuments(fileName) {
                let fileString = accessStem + fileName
                if let url = URL(string: fileString ) {
                  DispatchQueue.global(qos: .utility).async {
                    if let data = try? Data(contentsOf: url) {
                        let photoURL =  self.urlToFileInDocuments(fileName)

                        //Write the data to backing store.
                        try? data.write(to: photoURL, options: .noFileProtection)
                        print( "file is at \(photoURL)")
                    }

                  }
                }
            }
        }
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
