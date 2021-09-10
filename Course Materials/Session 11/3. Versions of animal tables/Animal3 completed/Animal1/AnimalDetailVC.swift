//
//  AnimalDetailVC.swift
//  Animal1
//
//  Created by Chris Price on 17/06/2021.
//

import UIKit

class AnimalDetailVC: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    
    var valueForLabel = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = valueForLabel
        photo.image = UIImage(named: "\(valueForLabel).jpg")

    }
    


}
