//
//  SpeakerTableVC.swift
//  ConfSpeakers
//
//  Created by Chris Price on 09/07/2021.
//

import UIKit

class SpeakerTableVC: UITableViewController {
    
    var speakers = ConferenceData.sharedInstance.allSpeakers

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakerCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = speakers[indexPath.row].name
        return cell
    }

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPathForSelectedRow!
        let myVC = segue.destination as! SpeakerVC
        myVC.chosenSpeaker = speakers[indexPath.row]
  
    }
    

}
