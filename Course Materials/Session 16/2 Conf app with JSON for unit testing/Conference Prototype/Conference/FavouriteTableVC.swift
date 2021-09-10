//
//  FavouriteTableVC.swift
//  Conference
//
//  Created by Chris Price on 19/06/2021.
//

import UIKit

class FavouriteTableVC: UITableViewController {
    
    let dates = [ ["Monday", "2019-12-10" ], ["Tuesday", "2019-12-11" ], ["Wednesday", "2019-12-12" ], ["Thursday", "2019-12-13" ]]
    
    var daySessions: [[Talk]] = []  // An array of sessionItems for each day
    
    func checkFavourites() {
        let sessions = ConferenceData.sharedInstance.allTalks
        daySessions = []
        for date in dates {
            let todaysSessions = sessions.filter{$0.sessionDate == date[1]
                && ConferenceData.sharedInstance.favourites.contains($0.id)}
            daySessions.append(todaysSessions.sorted())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkFavourites()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dates.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if daySessions[section].count > 0 {
            return daySessions[section].count
        }
        return 1 // 
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dates[section][0]
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if daySessions[indexPath.section].count == 0 { //No favourites, so put empty section message
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath)
            cell.textLabel?.text = "No favourites for today"
            return cell
        }
        
        let sessionInfo = daySessions[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TalkCell", for: indexPath) as! TalkCell
            
        // Configure the cell...
        cell.startTime.text = sessionInfo.timeStart
        cell.endTime.text = sessionInfo.timeEnd
        cell.title.text = sessionInfo.title
        cell.speaker.text = sessionInfo.speakerName
            
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let sessionInfo = daySessions[indexPath.section][indexPath.row]
        let myVC = segue.destination as! SessionVC
        myVC.title = "\(dates[indexPath.section][0]) \(sessionInfo.timeStart)"
        myVC.sessionDetails = sessionInfo
    }

}
