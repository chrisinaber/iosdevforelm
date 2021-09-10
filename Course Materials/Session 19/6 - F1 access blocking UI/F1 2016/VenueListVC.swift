//
//  VenueListVC.swift
//  F1 2016
//
//  Created by Chris Price on 05/07/2021.
//

import UIKit
import SafariServices
import WebKit

class VenueListVC: UITableViewController {
    
    var races = [ Race(round: "", url: nil, raceName: "Waiting for data")]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print( Date() )
        // Read the JSON file
        if let url = URL(string: "https://ergast.com/api/f1/2016.json") {
            if let data = try? Data(contentsOf: url) {
               let decoder = JSONDecoder()
               let schedule = try! decoder.decode(Schedule.self, from: data)
               self.races = schedule.MRData.RaceTable.Races
               self.tableView.reloadData()
            }
        }
        print( Date() )
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RacenameCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = "Race \(races[indexPath.row].round): \(races[indexPath.row].raceName)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = races[indexPath.row].url {
            let myWebVC = SFSafariViewController(url: url)
            present(myWebVC, animated: true, completion: nil)
        }
    }
    
}

