//
//  PictureCell.swift
//  Animal1
//
//  Created by Chris Price on 07/02/2022.
//

import UIKit

class PictureCell: UITableViewCell {
    @IBOutlet var photo: UIImageView!
    @IBOutlet var animalName: UILabel!

    func configure(photoName: String, animal: String) {
        photo.image = UIImage(named: photoName)
        animalName.text = animal
    }
}
