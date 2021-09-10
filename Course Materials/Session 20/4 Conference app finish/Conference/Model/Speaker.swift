//
//  Speaker.swift
//
//  Created by Chris Price on 18/06/2021.
//

import Foundation

struct Speaker: Equatable, Comparable, Codable {
    var id: String
    var name: String
    var biography: String
    var twitter: String
    
    static func == (lhs: Speaker, rhs: Speaker) -> Bool {
        return
            lhs.name == rhs.name
    }
    static func < (lhs: Speaker, rhs: Speaker) -> Bool {
        lhs.name < rhs.name
    }
   
}


