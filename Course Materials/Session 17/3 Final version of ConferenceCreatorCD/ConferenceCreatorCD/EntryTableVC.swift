//
//  EntryTableVC.swift
//  ConferenceCreator
//
//  Created by Chris Price on 23/06/2021.
//

import UIKit
import CoreData

class EntryTableVC: UITableViewController {

    @IBOutlet weak var speakerName: UITextField!
    
    @IBOutlet weak var speakerBio: UITextView!
    
    @IBOutlet weak var twitterHandle: UITextField!
    
    @IBAction func saveEntry(_ sender: Any) {
        // If name is blank, give an alert
        //else add speaker to speaker list and return
        if let name = speakerName.text, let bio = speakerBio.text, let twitter = twitterHandle.text {
            let id = name.trimmingCharacters(in: .whitespacesAndNewlines)
            if id == "" {
                let alert = UIAlertController(title: "Sorry", message: "You need to add a name to save a speaker", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
               addSpeaker(id: id, name: name, biography: bio, twitter: twitter)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func addSpeaker(id: String, name: String, biography: String, twitter: String) {
        // Get the managed context from the AppDelegate
        var managedContext: NSManagedObjectContext!
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedContext = appDelegate?.persistentContainer.viewContext
        
        // Make the new speaker and add it
        let entity = NSEntityDescription.entity( forEntityName: "Speaker", in: managedContext)!
        let speaker = Speaker(entity: entity, insertInto: managedContext)
        speaker.id = id
        speaker.name = name
        speaker.biography = biography
        speaker.twitter = twitter
        try? managedContext.save()
        
        //Following code is just to find Documents (not really needed)
        let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = docDirectory.appendingPathComponent("dummy")
        print( "\(fileURL)" )
    }

}
