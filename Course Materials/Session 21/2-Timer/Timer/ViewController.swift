//
//  ViewController.swift
//  Timer
//
//  Created by Chris Price on 02/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var minuteCount: UILabel!
    
    @IBOutlet weak var minuteValue: UIStepper!
    
    @IBAction func updateCount(_ sender: UIStepper) {
        minuteCount.text = "\(Int(sender.value))"
    }
    
    @IBAction func setTimer(_ sender: UIButton) {
        let minutes = minuteValue.value
        UNUserNotificationCenter.current().requestAuthorization(
        options : [.alert, .badge, .sound]) { success, error in
            if success {
               let content = UNMutableNotificationContent()
                content.title = "Timer"
                content.subtitle = "Your time is up!"
                content.sound = UNNotificationSound.default
                // show this notification on startdate
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: minutes*60.0, repeats: false)
                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString,
                                           content: content, trigger: trigger)
                // add our notification request
                UNUserNotificationCenter.current().add(request) { (error: Error?) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }

            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

