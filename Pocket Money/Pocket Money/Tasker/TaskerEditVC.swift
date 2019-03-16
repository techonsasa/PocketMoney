//
//  TaskerProfilePage.swift
//  Pocket Money
//
//  Created by Avishi Goyal on 2/23/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskerEditVC : UIViewController, UINavigationControllerDelegate {
    var taskerImagePicker: UIImagePickerController?
    var userdata: NSDictionary?
    var ref = Database.database().reference()
    
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

    @IBAction func saveButton(_ sender: Any) {
        let fullName = taskerName.text?.components(separatedBy: " ")
        let firstName = fullName?[0]
        let lastName = fullName?[1]
        let gender = taskerGender.text
        let email = taskerEmail.text
        let phoneNumber = taskerNumber.text
        let bio = taskerBio.text
        let age = taskerAge.text
        
        let data =
            ["firstName" : firstName,
             "lastName" : lastName,
             "email" : email,
             "phoneNumber" : phoneNumber,
             "age" : age,
             "gender" : gender,
             "bio" : bio
        ]
        let username = userdata!["username"] as? String
        print (username)
        ref.child("users").child(username!).updateChildValues(data)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

