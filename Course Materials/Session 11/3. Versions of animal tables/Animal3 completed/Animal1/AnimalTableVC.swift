//
//  AnimalTableVC.swift
//  Animal1
//
//  Created by Chris Price on 17/06/2021.
//

import UIKit

class AnimalTableVC: UITableViewController {

    var categories = ["Dogs", "Cats", "Rabbits" ]
        
    var categoryItems = [ [ "Collie", "Labrador", "Dalmation",
                             "Doberman", "Afghan"],
                                           [ "Siamese", "Manx", "Persian"],
                                           [  "Dutch", "Chinchilla", "Lionhead"]]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItems[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
        cell.textLabel!.text = categoryItems[indexPath.section][indexPath.row]
        
        switch indexPath.section {
        case 0: cell.backgroundColor = UIColor.yellow
        case 1: cell.backgroundColor = UIColor.purple
        default: cell.backgroundColor = UIColor.green
        }
        return cell
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let detailVC = segue.destination as! AnimalDetailVC
                    detailVC.valueForLabel = categoryItems[indexPath.section][indexPath.row]
                }
            }
        }

}
