//
//  EntryTableVC.swift
//  ConferenceCreator
//
//  Created by Chris Price on 23/06/2021.
//

import UIKit

class EntryTableVC: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var imagePicker: UIImagePickerController!
    
    var userImage: UIImage? = nil
    
    @IBOutlet weak var speakerName: UITextField!
    
    @IBOutlet weak var speakerBio: UITextView!
    
    @IBOutlet weak var twitterHandle: UITextField!
    
    @IBAction func takePhoto(_ sender: UIButton) {
            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            //imagePicker.sourceType = .camera
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
     }
    
    @IBAction func saveEntry(_ sender: Any) {
        // If name is blank, give an alert
        //else add speaker to speaker list and return
        if let name = speakerName.text, let bio = speakerBio.text, let twitter = twitterHandle.text {
            let id = name.filter{$0 != " "}
            if id == "" {
                let alert = UIAlertController(title: "Sorry", message: "You need to add a name to save a speaker", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                ConferenceData.sharedInstance.addSpeaker(newSpeaker: Speaker(id: id, name: name, biography: bio, twitter: twitter))
                // Deal with photo if taken
                if let photo = userImage {
                    if let data = photo.pngData() {
                        let filename = getDocumentsDirectory().appendingPathComponent("\(id).png")
                            try? data.write(to: filename)
                        print( "Firectory is \(getDocumentsDirectory())")
                    }
                }
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    // MARK: image picker delegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let imagenow = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        userImage = resizeImage(image: imagenow!, newWidth: 200)
            
        imagePicker.dismiss(animated: true, completion: nil)
       // characterImage.image = info[.originalImage] as? UIImage
        
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
                                                                                                                                      
    }

}
