//
//  AnimateVC.swift
//  Animate
//
//  Created by Chris Price on 27/11/2019.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import UIKit

class AnimateVC: UIViewController {
    
    
    @IBOutlet weak var spaceship: UIImageView!
 
    
    @IBAction func zoomIn(_ sender: Any) {
        spaceship.center.y  += view.bounds.height
        UIView.animate(withDuration: 2.5) {
          self.spaceship.center.y -= self.view.bounds.height
        }
    }
    
    
    @IBAction func resize(_ sender: Any) {
            UIView.animate(withDuration: 2.0, animations: {
                self.spaceship.frame = CGRect(origin: CGPoint(x: self.spaceship.frame.minX-(self.spaceship.frame.width/2), y: self.spaceship.frame.minY-(self.spaceship.frame.height/2)), size: CGSize(width: self.spaceship.frame.width*2, height: self.spaceship.frame.height*2))
                    
            })
           
        }
    
    @IBAction func makeInvisible(_ sender: Any) {
        UIView.animate(withDuration: 4.0, animations: {
                self.spaceship.alpha = 0.0
            }, completion: {_ in UIView.animate(withDuration: 5.0, animations: {self.spaceship.alpha = 1.0})
            })
    }

    @IBAction func colour(_ sender: Any) {
        UIView.animate(withDuration: 6.0, animations: {
            if self.view.backgroundColor == .green {
                self.view.backgroundColor = .yellow
            } else {
               self.view.backgroundColor = .green
            }
        })
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bouncy(_ sender: Any) {
          spaceship.center.y  += view.bounds.height
          UIView.animate(withDuration: 4.0, delay: 0.2,
          usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [],
          animations: {
            self.spaceship.center.y -= self.view.bounds.height
          })
      }


}

