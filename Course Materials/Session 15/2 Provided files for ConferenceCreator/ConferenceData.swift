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
    
    var allSpeakers: [Speaker] = [
        Speaker(id: "ChrisPrice", name: "Chris Price", biography: "Giving course at Elm", twitter: "iosdevuk"),
        Speaker(id: "NeilTaylor", name: "Neil Taylor", biography: "Works with Chris Price", twitter: "digidol")]
 
    func addSpeaker(newSpeaker: Speaker) {
        allSpeakers.append(newSpeaker)
    }
    
}
