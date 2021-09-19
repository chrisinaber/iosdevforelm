//
//  ConferenceCreatorTests.swift
//  ConferenceCreatorTests
//
//  Created by Chris Price on 23/06/2021.
//

import XCTest
@testable import ConferenceCreator

class ConferenceCreatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyBio1() throws {
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var result = true
        var message = "Bios without name are:"
        for speaker in ConferenceData.sharedInstance.allSpeakers {
            if speaker.biography == " " {
                result = false
                message = message + "\n - \(speaker.name)"
            }
        }
        XCTAssert(result, message)
        
    }
    
    func testEmptyBio2() throws {
        let speakers = ConferenceData.sharedInstance.allSpeakers
        let speakersNoBio = speakers.filter{$0.biography == " "}
        if speakersNoBio.count > 0 {
            var message = "Bios without name are:"
            for speaker in speakersNoBio {
                message = message + "\n - \(speaker.name)"
            }
            XCTAssert(speakersNoBio.count == 0, message)
        }
        
    }

  

}
