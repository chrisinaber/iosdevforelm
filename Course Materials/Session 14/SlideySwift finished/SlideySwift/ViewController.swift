//
//  ViewController.swift
//  SlideySwift
//
//  Created by Chris Price on 02/02/2021.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let motionManager = CMMotionManager()
    var myTimer: Timer!
    
    @IBOutlet weak var slidey: UIImageView!
    
    
    @IBOutlet weak var xValue: UILabel!
    
    @IBOutlet weak var yValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (motionManager.isDeviceMotionAvailable) {
           print("We can detect motion")
           
           // Update 60 times per second
           motionManager.deviceMotionUpdateInterval = 1.0/60.0
            
           let timer = Timer(fire: Date(), interval: (1.0/60.0),
                        repeats: true, block: { (timer) in
                     // Get the accelerometer data.
                            self.accelUpdate()
                     }
                  )
            RunLoop.current.add(timer, forMode: .default)
      } else {
           print("Can't use CMMotion on this device");
      }
        
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        motionManager.startAccelerometerUpdates()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        motionManager.stopAccelerometerUpdates()
    }
    
    func accelUpdate() {
        if let accelerometerData = motionManager.accelerometerData {
            let xGravity = accelerometerData.acceleration.x
            let yGravity = accelerometerData.acceleration.y
            // Write values on screen
            xValue.text = String(format: "x accel is %.1f", xGravity)
            yValue.text = String(format: "y accel is %.1f", yGravity)
            let xChange = (xGravity*40)
            let yChange = -(yGravity*40)
            // Calculate values and move unless against edge
           if ((self.slidey.center.x > 75) && (xChange < 0))
                || ((self.slidey.center.x < self.view.frame.size.width-75) && (xChange > 0)) {
              self.slidey.center.x = CGFloat(Double(self.slidey.center.x)+xChange)
           }
            if ((self.slidey.center.y > 75) && (yChange < 0))
                 || ((self.slidey.center.y < self.view.frame.size.height-75) && (yChange > 0)) {
               self.slidey.center.y = CGFloat(Double(self.slidey.center.y)+yChange)
            }
        }
        

    }


}

