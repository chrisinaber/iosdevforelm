//
//  WordDB.swift
//  arabic
//
//  Created by Chris Price on 01/09/2021.
//

import Foundation

class WordDB: ObservableObject {
    @Published var wordList: [VocabItem] = []
    
    init() {
        loadWords()
    }
    
    func loadWords() {
        if fileExistsInDocuments("wordlist.json") {
            let readListURL =  urlToFileInDocuments("wordlist.json")
            if let dataFromFile = try? Data(contentsOf: readListURL) {
                // Decode the json back to state of program
                let decoder = JSONDecoder()
                if let loadedArray = try? decoder.decode([VocabItem].self, from: dataFromFile) {
                    wordList = loadedArray.sorted(by: <)
                }
            }
        } else {
            saveWords()
        }
    }
    
    func saveWords() {
        let readListURL =  urlToFileInDocuments("wordlist.json")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(wordList) {
            //Write the data to backing store.
            try? data.write(to: readListURL, options: .noFileProtection)
        }
    }
    
    func addWord(newWord: VocabItem) {
        wordList.append(newWord)
        saveWords()
    }
    
    func fileExistsInDocuments( _ fileName: String ) -> Bool {
        let fileManager = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        let filepathName = docsDir + "/\(fileName)"
        print( "path is \(filepathName)")
        return fileManager.fileExists(atPath: filepathName)
    }
    
    func urlToFileInDocuments( _ fileName: String ) -> URL {
        let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = docDirectory.appendingPathComponent(fileName)
        return fileURL
    }
}
