//
//  SessionListTVC.swift
//  Conference
//
//  Created by Chris Price on 15/06/2021.
//

import UIKit

class SessionListTVC: UITableViewController {
    
    let dates = [ ["Monday", "2019-12-10" ], ["Tuesday", "2019-12-11" ], ["Wednesday", "2019-12-12" ], ["Thursday", "2019-12-13" ]]
    
    var daySessions: [[Talk]] = []  // An array of sessionItems for each day
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let sessions = ConferenceData.sharedInstance.allTalks
        
        for date in dates {
            let todaysSessions = sessions.filter{$0.sessionDate == date[1]}
            daySessions.append(todaysSessions.sorted())
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dates.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daySessions[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dates[section][0]
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sessionInfo = daySessions[indexPath.section][indexPath.row]
        if sessionInfo.sessionType != "talk"
            { // Treat as non-speaker session
            let cell = tableView.dequeueReusableCell(withIdentifier: "BreakCell", for: indexPath) as! BreakCell
            
            // Configure the cell...
            cell.startTime.text = sessionInfo.timeStart
            cell.endTime.text = sessionInfo.timeEnd
            cell.title.text = sessionInfo.title
            let location = ConferenceData.sharedInstance.locationFromLocationId(locationId: sessionInfo.locationId)
            cell.location.text = location.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TalkCell", for: indexPath) as! TalkCell
            
            // Configure the cell...
            cell.startTime.text = sessionInfo.timeStart
            cell.endTime.text = sessionInfo.timeEnd
            cell.title.text = sessionInfo.title
            cell.speaker.text = sessionInfo.speakerName
            
            return cell
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let sessionInfo = daySessions[indexPath.section][indexPath.row]

        if segue.identifier == "showSession" { // Pressed speaker button
            let myVC = segue.destination as! SessionVC
            myVC.title = "\(dates[indexPath.section][0]) \(sessionInfo.timeStart)"
            myVC.sessionDetails = sessionInfo
        } else {
            let myVC = segue.destination as! LocationVC
            let location = ConferenceData.sharedInstance.locationFromLocationId(locationId: sessionInfo.locationId)
            myVC.chosenLocation = location
        }
    }

}
