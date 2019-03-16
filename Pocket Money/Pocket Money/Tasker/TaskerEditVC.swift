//
//  TaskerProfilePage.swift
//  Pocket Money
//
//  Created by Avishi Goyal on 2/23/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskerEditVC : UIViewController, UINavigationControllerDelegate {
    var taskerImagePicker: UIImagePickerController?
    var userdata: NSDictionary?
    
//IBOutlets
    @IBOutlet var taskerName: UITextField!
    @IBOutlet var taskerUsername: UITextField!
    @IBOutlet var taskerGender: UITextField!
    @IBOutlet var taskerAge: UITextField!
    @IBOutlet var taskerEmail: UITextField!
    @IBOutlet var taskerNumber: UITextField!
    @IBOutlet var taskerBio: UITextView!
    
//Camera
    @IBOutlet weak var taskerPreviewPFP: UIImageView!
    @IBAction func openCamera(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            taskerImagePicker = UIImagePickerController()
            taskerImagePicker?.delegate = self
            taskerImagePicker?.sourceType = .camera
            taskerImagePicker?.allowsEditing = false
            self.present(taskerImagePicker!, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
//Initial Population of Data
        let firstName = userdata!["firstName"] as! String
        let lastName = userdata!["lastName"] as! String
        let fullname = firstName + " " + lastName
        taskerName.text = fullname
        taskerUsername.text = userdata!["username"] as! String
        taskerGender.text = userdata!["gender"] as! String
        taskerAge.text = userdata!["age"] as! String
        taskerEmail.text = userdata!["email"] as! String
        taskerNumber.text = userdata!["phoneNumber"] as! String
        taskerBio.text = userdata!["bio"] as! String
    }



}

extension TaskerEditVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        taskerPreviewPFP.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

