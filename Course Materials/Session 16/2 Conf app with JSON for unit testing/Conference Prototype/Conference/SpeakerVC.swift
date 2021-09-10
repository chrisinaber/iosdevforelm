//
//  SpeakerVC.swift
//  Conference
//
//  Created by Chris Price on 18/06/2021.
//

import UIKit

class SpeakerVC: UIViewController {
    
    var chosenSpeaker: Speaker!  // Filled in when this view controller is called

    
    @IBOutlet weak var speakerImage: UIImageView!
    
    @IBOutlet weak var speakerDets: UITextView!
    
    @IBOutlet weak var speakerTwitter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        self.title = chosenSpeaker.name
        speakerImage.image = UIImage(named: "\(chosenSpeaker.id).jpg")
        speakerDets.text = chosenSpeaker.biography
        if chosenSpeaker.twitter == "" {
            speakerTwitter.text = "No Twitter Handle"
        } else {
            speakerTwitter.text = "Twitter handle: \(chosenSpeaker.twitter)"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
