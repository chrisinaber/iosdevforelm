//
//  VocabItem.swift
//  arabic
//
//  Created by Chris Price on 01/09/2021.
//

import Foundation

struct VocabItem: Codable, Identifiable, Equatable, Comparable {
    var id = UUID()
    let englishWord: String
    let arabicWord: String
    let wordType: String
    
    static func == (lhs: VocabItem, rhs: VocabItem) -> Bool {
        return
            lhs.englishWord.lowercased() == rhs.englishWord.lowercased() &&
                lhs.arabicWord.lowercased() == rhs.arabicWord.lowercased()
    }
    
    static func < (lhs: VocabItem, rhs: VocabItem) -> Bool {
      
        return lhs.arabicWord.lowercased() < rhs.arabicWord.lowercased()
    }
}
