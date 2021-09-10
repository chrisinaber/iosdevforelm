//
//  SessionVC.swift
//  Conference
//
//  Created by Chris Price on 15/06/2021.
//

import UIKit

class SessionVC: UIViewController {

    var sessionDetails: Talk!
    
    
    @IBOutlet weak var sessionTitle: UILabel!
    
    @IBOutlet weak var sessionSpeaker: UIButton!
    
    @IBOutlet weak var sessionContents: UITextView!
    
    @IBOutlet weak var sessionLocation: UIButton!
    
    @IBOutlet weak var heartButton: UIBarButtonItem!
    
    @IBAction func toggleFavourite(_ sender: UIBarButtonItem) {
        if ConferenceData.sharedInstance.favourites.contains(sessionDetails.id) {
            sender.image = UIImage(systemName: "heart" )
            let index = ConferenceData.sharedInstance.favourites.firstIndex(of: sessionDetails.id)
            if let index = index {
                ConferenceData.sharedInstance.favourites.remove(at: index)
            }
            print("Favourites after removed are \(ConferenceData.sharedInstance.favourites)")
        } else {
            ConferenceData.sharedInstance.favourites.append(sessionDetails.id)
            sender.image = UIImage(systemName: "heart.fill" )
            print("Favourites after added are \(ConferenceData.sharedInstance.favourites)")
        }
        ConferenceData.sharedInstance.saveFavourites()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sessionTitle.text = sessionDetails.title
        sessionSpeaker.setTitle(sessionDetails.speakerName, for: .normal)
        sessionContents.text = sessionDetails.content
        sessionLocation.setTitle(sessionDetails.locationName, for: .normal)
        if ConferenceData.sharedInstance.favourites.contains(sessionDetails.id) {
            heartButton.image = UIImage(systemName: "heart.fill" )
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showSpeaker" { // Pressed speaker button
           let myVC = segue.destination as! SpeakerVC
            myVC.chosenSpeaker = ConferenceData.sharedInstance.speakerFromSpeakerId(speakerId:  sessionDetails.speakerId)
        } else if segue.identifier == "showLocation" {  // Pressed location button
            let myVC = segue.destination as! LocationVC
            myVC.chosenLocation = ConferenceData.sharedInstance.locationFromLocationId(locationId: sessionDetails.locationId)
        }
    }
    

}
