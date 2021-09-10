//
//  ViewController.swift
//  Swiper
//
//  Created by Chris Price on 17/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        if count < 9 {
            count = count + 1
            counter.text = "\(count)"
        }
    }
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        if count > 0 {
            count = count - 1
            counter.text = "\(count)"
        }
    }
    
    
    @IBOutlet weak var counter: UILabel!
    
    var count = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

