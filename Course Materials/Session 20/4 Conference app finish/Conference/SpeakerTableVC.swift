//
//  SpeakerTableVC.swift
//  Conference
//
//  Created by Chris Price on 12/07/2021.
//

import UIKit

class SpeakerTableVC: UITableViewController {
    
    var speakers = ConferenceData.sharedInstance.allSpeakers

    override func viewDidLoad() {
        super.viewDidLoad()
        ConferenceData.sharedInstance.loadAllConfInfo(update: {
            self.speakers = ConferenceData.sharedInstance.allSpeakers
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if speakers.count > 0 {return speakers.count}
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakerCell", for: indexPath)

        // Configure the cell...
        if speakers.count > 0 {
            cell.textLabel?.text = speakers[indexPath.row].name
        } else {
            cell.textLabel?.text = "No speakers loaded yet"
        }
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
