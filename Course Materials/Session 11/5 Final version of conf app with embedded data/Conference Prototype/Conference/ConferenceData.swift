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
    
    var allTalks: [Talk] = []
    var allSpeakers: [Speaker] = []
    var allLocations: [Location] = []
    
    var favourites: [String] = []
    
    init(){
        allTalks = loadTalks()
        allSpeakers = loadSpeakers()
        allLocations = loadLocations()
        
        loadFavourites();
    }
    
    func loadFavourites() {
        if fileExistsInDocuments("favourites.json") {
            let readListURL =  urlToFileInDocuments("favourites.json")
            if let dataFromFile = try? Data(contentsOf: readListURL) {
                // Decode the plist back to state of program
                let decoder = JSONDecoder()
                if let loadedArray = try? decoder.decode([String].self, from: dataFromFile) {
                    favourites = loadedArray
                }
            }
        } else {
            saveFavourites()
        }
    }
    
    func saveFavourites() {
        let readListURL =  urlToFileInDocuments("favourites.json")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(favourites) {
            //Write the data to backing store.
            try? data.write(to: readListURL, options: .noFileProtection)
        }
    }
    
    func speakerFromSpeakerId( speakerId: String ) -> Speaker {
        let speakers = allSpeakers.filter{$0.id == speakerId}
        if speakers.isEmpty {
            return allSpeakers[0]
        }
        return speakers[0]
    }
    
    func locationFromLocationId( locationId: String ) -> Location {
        let locations = allLocations.filter{$0.id == locationId}
        if locations.isEmpty {
            return allLocations[0]
        }
        return locations[0]
    }
    
    func loadTalks() -> [Talk]{
        return [
            Talk(id: "arkit", title: "Using ARKit with SpriteKit", content: "ARKit is the hot new framework announced at WWDC 2017. This workshop will get your feet wet so that you can create the augmented reality application of your dreams. ", locationId: "b23", sessionDate: "2019-12-10", sessionOrder: 0, timeStart: "16:00", timeEnd: "18:00", sessionType: "talk", speakerId: "JanieClayton"),
            Talk(id: "spoons", title: "Optional Social", content: "Come to Yr Hen Orsaf (local Wetherspoons) when you arrive in Aber, and meet some other delegates. If you are coming to Aber by train, it is easy to find - it's part of the railway station.", locationId: "spoons", sessionDate: "2019-12-10", sessionOrder: 1, timeStart: "18:00", timeEnd: "23:59", sessionType: "dinner", speakerId: ""),
            Talk(id: "registration", title: "Registration", content: "Collect your badge and registration goodies,.", locationId: "foyer", sessionDate: "2019-12-11", sessionOrder: 0, timeStart: "09:00", timeEnd: "09:30", sessionType: "registration", speakerId: ""),
            Talk(id: "welcome", title: "Welcome / Introduction", content: "A welcome to iOSDevUK 2017 and some information about the conference and the conference meal later today.", locationId: "physmain", sessionDate: "2019-12-11", sessionOrder: 1, timeStart: "09:30", timeEnd: "09:40", sessionType: "talk", speakerId: "NeilTaylor"),
            Talk(id: "coreml", title: "I'll tell you what you can do with Core ML", content: "The introduction of CoreML in iOS 11 got the community very excited about machine learning, and how it will 'change the world'.", locationId: "physmain", sessionDate: "2019-12-11", sessionOrder: 2, timeStart: "09:40", timeEnd: "10:20", sessionType: "talk", speakerId: "SamDavies"),
            Talk(id: "indieos", title: "Indie iOS Development: Things I've learnt after 5 million downloads", content: "Sarp's talk will be about building App Store hits as an indie developer, the strategies he and his partner used to market our products as well as the technologies and design tools we’ve chosen.", locationId: "physmain", sessionDate: "2019-12-11", sessionOrder: 3, timeStart: "10:20", timeEnd: "11:00", sessionType: "talk", speakerId: "SarpErdag"),
            Talk(id: "coffee1", title: "Coffee Break", content: "Coffee and cakes available in the Physics Foyer. ", locationId: "foyer", sessionDate: "2019-12-11", sessionOrder: 4, timeStart: "11:00", timeEnd: "11:30", sessionType: "coffee", speakerId: ""),
            Talk(id: "iotwithswift", title: "Programming the Internet of Things with Swift", content: "Now that Swift is open source, can it be made to run on battery-powered Internet of Things devices running at 48-MHz with as little as 20KB of RAM? Let's find out! And along the way we'll also try to answer the question: Why?", locationId: "physmain", sessionDate: "2019-12-11", sessionOrder: 5, timeStart: "11:30", timeEnd: "12:10", sessionType: "talk", speakerId: "StevenGray"),
            Talk(id: "serverswift", title: "What App Developers Should Know about Server-Side Swift", content: "What App Developers Should Know about Server-Side Swift", locationId: "physmain", sessionDate: "2019-12-11", sessionOrder: 6, timeStart: "12:10", timeEnd: "12:50", sessionType: "talk", speakerId: "ClausHofele"),
            Talk(id: "lunch1", title: "Lunch", content: "Lunch is available in the Physics Foyer, where you registered. ", locationId: "foyer", sessionDate: "2019-12-11", sessionOrder: 7, timeStart: "12:50", timeEnd: "14:00", sessionType: "lunch", speakerId: ""),
            Talk(id: "uiautomation", title: "UI Automation in Mobile Apps", content: "How Trainline uses Xode UI Automation techniques - with code examples and how to approach it.", locationId: "a6", sessionDate: "2019-12-11", sessionOrder: 8, timeStart: "14:00", timeEnd: "14:40", sessionType: "talk", speakerId: "AndreyKozlov"),
            Talk(id: "animation", title: "Taming Animation", content: "Animations set iOS apart from Android, they are the signature garnish on top of every app recognized by Apple Design Awards.", locationId: "a6", sessionDate: "2019-12-11", sessionOrder: 9, timeStart: "14:40", timeEnd: "15:20", sessionType: "talk", speakerId: "SashZats"),
            Talk(id: "codesigning", title: "At This Point Size in Time", content: "Achieving better accessibility, legibility and visual consistency in your app through Dynamic Type support.", locationId: "a6", sessionDate: "2019-12-11", sessionOrder: 10, timeStart: "15:20", timeEnd: "16:00", sessionType: "talk", speakerId: "RossButler"),
            Talk(id: "coffee2", title: "Coffee Break", content: "Coffee and biscuits available in the Physics Foyer. ", locationId: "foyer", sessionDate: "2019-12-11", sessionOrder: 11, timeStart: "16:00", timeEnd: "16:30", sessionType: "coffee", speakerId: ""),
            Talk(id: "fileextensions", title: "File provider extensions in iOS 11", content: "iOS 11 introduces a new extension point, File Provider, for cloud storage services to hook into the Files app and other apps that support file browsing. Let's learn how to make one!", locationId: "physmain", sessionDate: "2019-12-11", sessionOrder: 12, timeStart: "16:30", timeEnd: "17:10", sessionType: "talk", speakerId: "AmyWorrall"),
            Talk(id: "continuousdelivery", title: "Continuous Delivery", content: "A detailed talk on how you can make continuous delivery to the App Store. Using Jenkins as the CI and Jira for task management bundled in an automated pipeline to help speed up your App Store delivery process.", locationId: "physmain", sessionDate: "2019-12-11", sessionOrder: 13, timeStart: "17:10", timeEnd: "17:50", sessionType: "talk", speakerId: "AdamRush"),
            Talk(id: "dinner", title: "Conference Dinner", content: "The meal is ordered. The location is set. The drinks are paid for. Come along and relax and chat about iOS, the Aberystwyth sunset, or anything else you fancy.", locationId: "medrus", sessionDate: "2019-12-11", sessionOrder: 14, timeStart: "19:00", timeEnd: "22:00", sessionType: "dinner", speakerId: ""),
            Talk(id: "fasttech1", title: "Hi tech fast talks", content: "Talks on exciting tech of the moment", locationId: "physmain", sessionDate: "2019-12-12", sessionOrder: 1, timeStart: "09:30", timeEnd: "10:40", sessionType: "talk", speakerId: ""),
            Talk(id: "coffee3", title: "Coffee Break", content: "Coffee and cakes available in the Physics Foyer. ", locationId: "foyer", sessionDate: "2019-12-12", sessionOrder: 2, timeStart: "10:40", timeEnd: "11:20", sessionType: "coffee", speakerId: ""),
            Talk(id: "swiftmemmanagement", title: "Brokering Resources: iOS, the user...& YOU!", content: "As iOS developers, it’s our job to leverage Apple's ecosystem to delight our users. In practice, this means making the “right” decisions and moving quickly to deliver each new valuable feature.", locationId: "physmain", sessionDate: "2019-12-12", sessionOrder: 3, timeStart: "11:20", timeEnd: "12:00", sessionType: "talk", speakerId: "RebeccaEakins"),
            Talk(id: "lensesprisms", title: "Lenses and Prisms in Swift", content: "The concept of functional lens has become pretty popular in functional programming circles, and there are already good contributions for applying lenses to other, traditionally imperative/OO contexts, like Javascript. I'd like to offer a more in depth view on why lenses can be useful in Swift, and also talk about a similar/different thing called Prism: it's likely that everyone that's interested in lenses has heard about prisms but it seems like, while the basic intuition behind a lens can be grasped, the one behind a prism is kind of obscure.", locationId: "physmain", sessionDate: "2019-12-12", sessionOrder: 4, timeStart: "12:00", timeEnd: "12:40", sessionType: "talk", speakerId: "ElviroRocca"),
            Talk(id: "lunch2", title: "Lunch", content: "Lunch is available in the Physics Foyer, where you registered. ", locationId: "foyer", sessionDate: "2019-12-12", sessionOrder: 5, timeStart: "12:40", timeEnd: "14:00", sessionType: "lunch", speakerId: ""),
            Talk(id: "multilingual", title: "Multilingual Swift: How to play nicely with other languages", content: "As Swift gets more widely used, it is becoming necessary to link it to frameworks written in other languages. Martin explains the features of the language that enable links to a wide range of other languages.", locationId: "physmain", sessionDate: "2019-12-12", sessionOrder: 6, timeStart: "14:00", timeEnd: "14:40", sessionType: "talk", speakerId: "MartinPilkington"),
            Talk(id: "guerillas", title: "Working with Guerillas - coding UX in every app", content: "As Software Engineers, it is our job to surprise and delight our users; providing engaging user experiences that does not detract from the key functionality of our products.", locationId: "physmain", sessionDate: "2019-12-12", sessionOrder: 7, timeStart: "14:40", timeEnd: "15:20", sessionType: "talk", speakerId: "SteveWestgarth"),
            Talk(id: "coffee4", title: "Coffee Break", content: "Coffee and biscuits available in the Physics Foyer. ", locationId: "foyer", sessionDate: "2019-12-12", sessionOrder: 8, timeStart: "15:20", timeEnd: "15:50", sessionType: "coffee", speakerId: ""),
            Talk(id: "scriptableios", title: "Making Scriptable iOS Apps", content: "I will talk about how you can provide a Javascript interface to your app and how it can help during development, as well as providing advanced users with increased powers.", locationId: "physmain", sessionDate: "2019-12-12", sessionOrder: 9, timeStart: "15:50", timeEnd: "16:30", sessionType: "talk", speakerId: "DanielTull"),
            Talk(id: "accessibility", title: "What minority are you in? - Accessibility in mobile apps", content: "This talk will look at the important issues to take into account when making your app accessible.", locationId: "physmain", sessionDate: "2019-12-12", sessionOrder: 10, timeStart: "16:30", timeEnd: "17:10", sessionType: "talk", speakerId: "AgnieszkaCzyzak"),
            Talk(id: "healthcare", title: "From Indie to CTO", content: "From Indie to CTO. Overcoming personal fears, such as imposter syndrome, to grow professionally, and the role that attending conferences can play in that journey", locationId: "physmain", sessionDate: "2019-12-12", sessionOrder: 11, timeStart: "17:10", timeEnd: "17:50", sessionType: "talk", speakerId: "AlanMorris"),
            Talk(id: "fasttech2", title: "Lightning talks", content: "Short talks on developer subjects.", locationId: "physmain", sessionDate: "2019-12-13", sessionOrder: 1, timeStart: "09:30", timeEnd: "10:10", sessionType: "talk", speakerId: ""),
            Talk(id: "codable", title: "Decoding Codable", content: "Apple's new Codable interface is easy to use simply, but has powerful potential in more complex situations.", locationId: "physmain", sessionDate: "2019-12-13", sessionOrder: 2, timeStart: "10:10", timeEnd: "10:50", sessionType: "talk", speakerId: "ChrisPrice"),
            Talk(id: "coffee5", title: "Coffee Break", content: "Coffee and cakes available in the Physics Foyer. ", locationId: "foyer", sessionDate: "2019-12-13", sessionOrder: 3, timeStart: "10:50", timeEnd: "11:20", sessionType: "coffee", speakerId: ""),
            Talk(id: "ibawesome", title: "Interface Builder considered awesome", content: "Storyboards and XIBs create horrible merge-conficts in teams, are unreviewable in Pull-Requests and they don't even support comments. So no responsible developer in a team should ever be using Interface Builder for a serious iOS project, right?", locationId: "physmain", sessionDate: "2019-12-13", sessionOrder: 4, timeStart: "11:20", timeEnd: "12:00", sessionType: "talk", speakerId: "JoachimKurz"),
            Talk(id: "havoc", title: "Cry 'Havoc!' and let slip the dogs of software", content: "Scotty explores the wonder of the software industry", locationId: "physmain", sessionDate: "2019-12-13", sessionOrder: 5, timeStart: "12:00", timeEnd: "12:40", sessionType: "talk", speakerId: "SteveScott"),
            Talk(id: "hack", title: "ARKit hack", content: "This hack session will have the challenge of building a working Apple Watch game.", locationId: "b23", sessionDate: "2019-12-13", sessionOrder: 6, timeStart: "13:30", timeEnd: "23:30", sessionType: "workshop", speakerId: "")
        ]
    }
    
    func loadSpeakers() -> [Speaker]{
        return [
            Speaker(id: "AdamRush", name: "Adam Rush", biography: "Adam Rush is a passionate iOS developer with over 6 years commercial experience, contracting all over the UK & Europe. He's a tech addict and #Swift enthusiast.", twitter: "adam9rush"),
            Speaker(id: "AgnieszkaCzyzak", name: "Agnieszka  Czyak", biography: "Agnieszka is a UX designer at Polidea.", twitter: "agaczyzak"),
            Speaker(id: "AlanMorris", name: "Alan Morris", biography: "With over 16 years in the tech and development industry, for organisations such as Orange and Accenture, Alan ran a successful iOS development agency before joining hedgehog lab to lead the development team.", twitter: "dippigu"),
            Speaker(id: "AmyWorrall", name: "Amy Worrall", biography: "App developer from Coventry, working for Facebook. Likes singing, cooking and playing board games.", twitter: "amyruthworrall"),
            Speaker(id: "AndreyKozlov", name: "Andrey Kozlov", biography: "I am a passionate iOS developer. TDD evangelist and Software Architect who cares about quality and creating maintainable and clear code.", twitter: "a_rayand"),
            Speaker(id: "ChrisPrice", name: "Chris Price", biography: "Chris is one of the organisers for iOSDevUK. He is also a lecturer at Aberystwyth University in Computer Science. He has a number of Apps in the App store to help people to learn Welsh. ", twitter: "iOSDevUK"),
            Speaker(id: "ClausHofele", name: "Claus Höfele", biography: "Claus supports the iOS Team at HERE as a Tech Lead to create personal mobility services for consumers. Author of AlexaSkillsKit and CCHMapClusterController", twitter: "claushoefele"),
            Speaker(id: "DanielTull", name: "Daniel Tull ", biography: "Daniel has been a Cocoa developer since the Java Bridge existed when macOS was known as OS X. He has since made his way up from developing apps for Sky, Tesco, BBC, Nespresso and Danone to the heights of Gok Wan’s glorious fashion app.", twitter: "danielctull"),
            Speaker(id: "JoachimKurz", name: "Joachim Kurz", biography: "Joachim is working as an iOS developer at Yelp and he likes to give talks about APIs and tools that are super-valuable in day-to-day live but are often overshadowed by discussions about the newest technologies or yet another architecture style. One of his favorite review-comments is 'there is a formatter for that'. He has seen many ways to do formatting badly and many unnecessary `stringWithFormat:` calls and is trying to fight them where possible", twitter: "cocoafrog"),
            Speaker(id: "MartinPilkington", name: "Martin Pilkington", biography: "Martin has been developing for Apple’s platforms for 13 years. More recently he has been trying to get Objective-C and Swift to play nicely with each other, and ranting on Twitter when they don’t.", twitter: "pilky"),
            Speaker(id: "NeilTaylor", name: "Neil Taylor", biography: "Neil helps out with iOSDevUK and worked on the conference App. He also lectures in Computer Science at Aberystwyth University. He works with Chris Price on the Welsh language apps.", twitter: "digidol"),
            Speaker(id: "RebeccaEakins", name: "Rebecca Eakins", biography: "Rebecca focuses on mobile and data science - with a special fondness for the intersection of the two. Before getting into programming, she read a lot of philosophy and literature and finds now that poetry and great code aren’t so different.", twitter: "ohrebeccago"),
            Speaker(id: "RossButler", name: "Ross Butler", biography: "Senior iOS Developer at Sainsbury's-Argos in London. Formerly BBC, working on CBeebies, CBBC and iPlayer products. Frequent speaker at meetups and conferences as well as ex-organiser of NSManchester, a meetup for iOS developers in the North-West.", twitter: "ross_w_butler"),
            Speaker(id: "SamDavies", name: "Sam Davies", biography: "Sam works writing books and giving training for raywenderlich.com", twitter: "iwantmyrealname"),
            Speaker(id: "SteveScott", name: "Steve Scott", biography: "Scotty is legendary in the MAC community as the organiser of the sadly defunct NSConference, but still appearing live at iOSDevUK.", twitter: "macdevnet"),
            Speaker(id: "SteveWestgarth", name: "Steve Westgarth", biography: "Steve is Engineering Manager at Boots UK.", twitter: "stevewestgarth"),
            Speaker(id: "JanieClayton", name: "Janie Clayton", biography: "Software engineer. Author of the forthcoming Metal Programming Guide. ENFJ. Agent of the revolution. Doer of impossible things.", twitter: "redqueencoder"),
            Speaker(id: "SarpErdag", name: "Sarp Erdag", biography: "Sarp is a mobile app developer , designer and entrepreneur from Istambul focusing on developing top-notch software products.", twitter: "sarperdag"),
            Speaker(id: "ElviroRocca", name: "Elviro Rocca", biography: "Elviro worked for some years as a Materials Engineer before focusing on his true passion: functional programming. He is the lead iOS Developer at Facile.it", twitter: "_logicist"),
            Speaker(id: "SashZats", name: "Sash Zats", biography: "Sash Zats is a designer and generative artist building toools for designers at Facebook. ", twitter: "zats"),
            Speaker(id: "StevenGray", name: "Steven Gray", biography: "Steven works in Oregon for SoftSource Consulting.", twitter: "sgray_sftsrc")
        ]
    }
    
    func loadLocations() -> [Location]{
        return [
            Location(id: "b23", name: "Llandinam B23", latitude: 52.416367, longitude: -4.066299, placeDescription: "The Hack on Thursday afternoon and evening will be run in this workroom."),
            
            Location(id: "spoons", name: "Yr Hen Orsaf", latitude: 52.414176, longitude: -4.08181, placeDescription: "This cafe is next to the railway station, so handy for meeting when we all arrive."),
            
            Location(id: "foyer", name: "Physics Foyer", latitude:  52.415941, longitude: -4.065818, placeDescription: "This is the location for the refreshments provided during the conference."),
            
            Location(id: "physmain", name: "Physics Main", latitude: 52.415941, longitude: -4.065818, placeDescription: "Main lecture theatre for the conference, near where registration happens."),
            
            Location(id: "a6", name: "Llandinam A6", latitude: 52.41647, longitude: -4.066544, placeDescription: "A6 is on the road below the Physical Sciences building. Turn right and it is about 100 meters on the right."),
            
            Location(id: "medrus", name: "Medrus Mawr", latitude:  52.417941, longitude: -4.064823, placeDescription: "The conference meal will be in Medrus, which is in the Penbryn building, close to the main entrance to campus.")
        ]
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
