//
//  EntryTableVC.swift
//  ConferenceCreator
//
//  Created by Chris Price on 23/06/2021.
//

import UIKit

class EntryTableVC: UITableViewController {


    @IBOutlet weak var speakerName: UITextField!
    
    @IBOutlet weak var speakerBio: UITextView!
    
    @IBOutlet weak var twitterHandle: UITextField!
    
    @IBAction func saveEntry(_ sender: Any) {
        // If name is blank, give an alert
        //else add speaker to speaker list and return
        if let name = speakerName.text, let bio = speakerBio.text, let twitter = twitterHandle.text {
            let id = name.filter{$0 != " "}
             if id == "" {
                let alert = UIAlertController(title: "Sorry", message: "You need to add a name to save a speaker", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                ConferenceData.sharedInstance.addSpeaker(newSpeaker: Speaker(id: id, name: name, biography: bio, twitter: twitter))
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }



}
