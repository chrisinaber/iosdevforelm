//
//  LocationTableVC.swift
//  Conference
//
//  Created by Chris Price on 18/06/2021.
//

import UIKit

class LocationTableVC: UITableViewController {
    
    var locations = ConferenceData.sharedInstance.allLocations

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)

        // Configure the cell...
        let location = locations[indexPath.row]
        cell.textLabel?.text = location.name
        cell.detailTextLabel?.text = location.placeDescription
        cell.imageView?.image = UIImage(named: "\(location.id).jpg")
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPathForSelectedRow!
        let myVC = segue.destination as! LocationVC
        myVC.chosenLocation = locations[indexPath.row]
    }
    

}
