import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Race: Decodable {
    let round: String
    let url: URL?
    let raceName: String
}

struct Schedule: Decodable {
    struct MRDataStruct: Decodable {
        struct RaceTableStruct: Decodable {
            let Races: [Race]
        }
        let RaceTable: RaceTableStruct
    }
    let MRData: MRDataStruct
}

if let url = URL(string: "http://ergast.com/api/f1/2016.json") {
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let goodData = data {
            if let myString = String(data: goodData, encoding: .utf8) { print(myString)}
            let decoder = JSONDecoder()
            let schedule = try! decoder.decode(Schedule.self, from: goodData)
            
            let races = schedule.MRData.RaceTable.Races
            for race in races {
                print( "Round \(race.round): \(race.raceName)")
            }
        }
    }
    
    task.resume()
}
