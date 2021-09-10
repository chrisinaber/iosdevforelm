//
//  AnimalDetailVC.swift
//  Animal1
//
//  Created by Chris Price on 17/06/2021.
//

import UIKit

class AnimalDetailVC: UIViewController {

    @IBOutlet weak var favourite: UILabel!
    
    var valueForLabel = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()

        favourite.text = valueForLabel
    }
    


}
