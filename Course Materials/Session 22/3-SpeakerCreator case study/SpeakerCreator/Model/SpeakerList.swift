//
//  SpeakerList.swift
//
//  Created by Chris Price on 18/06/2021.
//

import Foundation

class SpeakerList {
    var allSpeakers: [Speaker]
    
    init(populateSpeakers: () -> [Speaker]) {
         allSpeakers = populateSpeakers()
    }
    
}


