//
//  Talk.swift
//
//  Created by Chris Price on 18/06/2021.
//

import Foundation


struct Talk: Equatable, Comparable {
    var id: String
    var title: String
    var content: String
    var locationId: String
    var sessionDate: String
    var sessionOrder: Int
    var timeStart: String
    var timeEnd: String
    var sessionType: String
    var speakerId: String
    
    var speakerName: String {
        let speakers = ConferenceData.sharedInstance.allSpeakers.filter{$0.id == self.speakerId}
        if speakers.isEmpty {
            return ""
        }
        return speakers[0].name
    }
    
    var locationName: String {
        let locations = ConferenceData.sharedInstance.allLocations.filter{$0.id == self.locationId}
        if locations.isEmpty {
            return ""
        }
        return locations[0].name
    }
     
    static func == (lhs: Talk, rhs: Talk) -> Bool {
        return
            lhs.id == rhs.id
    }
    
    static func < (lhs: Talk, rhs: Talk) -> Bool {
        // Orders by day and then order within the day
        return lhs.sessionDate < rhs.sessionDate
        || (lhs.sessionDate == rhs.sessionDate
            && lhs.sessionOrder < rhs.sessionOrder)
    }
}
