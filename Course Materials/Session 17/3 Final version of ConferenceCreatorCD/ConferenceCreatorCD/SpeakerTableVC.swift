//
//  SpeakerTableVC.swift
//  ConferenceCreator
//
//  Created by Chris Price on 23/06/2021.
//

import UIKit
import CoreData

class SpeakerTableVC: UITableViewController {
    var managedContext: NSManagedObjectContext!

    var speakers: [Speaker] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedContext = appDelegate?.persistentContainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let fetch: NSFetchRequest<Speaker> = Speaker.fetchRequest()
          fetch.predicate = NSPredicate(format: "id != nil")
        do {
          let results = try managedContext.fetch(fetch)
            speakers = []
            for speaker in results {
                speakers.append(speaker)
            }
        } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
        }
        speakers = speakers.sorted()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if speakers.count == 0 {return 1}
        return speakers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakerCell", for: indexPath)

        // Configure the cell...
        if speakers.count > 0 {
           cell.textLabel?.text = speakers[indexPath.row].name
        } else {
            cell.textLabel?.text = "No speakers yet - add some"
        }
        return cell
    }
    
    @IBAction func unwindToSpeakerTable(unwindSegue: UIStoryboardSegue) {
        
    }
}
    
extension Speaker: Comparable {
    public static func < (lhs: Speaker, rhs: Speaker) -> Bool {
        if let leftname = lhs.name, let rightname = rhs.name {
            return leftname < rightname
        }
        return false
    }
}


