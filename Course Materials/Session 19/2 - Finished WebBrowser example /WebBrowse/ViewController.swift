//
//  ViewController.swift
//  WebBrowse
//
//  Created by Chris Price on 05/07/2021.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

  
    @IBOutlet weak var language: UISegmentedControl!
    
    @IBAction func loadURL(_ sender: UIButton) {
        // Do any additional setup after loading the view.
        var pageString = "https://www.elm.sa/ar"
        if language.selectedSegmentIndex == 1 {
            pageString = "https://www.elm.sa/en/"
        }
        if let pageURL = URL(string: pageString) {
            let browser = try SFSafariViewController.init(url: pageURL)
            present(browser, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

