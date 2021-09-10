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
    
    @IBOutlet weak var speakerName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        self.title = chosenSpeaker.name
        let fileName = chosenSpeaker.id + ".jpg"
        if ConferenceData.sharedInstance.fileExistsInDocuments(fileName) {
            let photoURL =  ConferenceData.sharedInstance.urlToFileInDocuments(fileName)
            if let dataFromFile = try? Data(contentsOf: photoURL) {
                speakerImage.image = UIImage(data: dataFromFile)
            }
        }
        speakerName.text = chosenSpeaker.name
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
