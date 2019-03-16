//
//  TaskerProfilePage.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 2/21/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeEditVC : UIViewController, UINavigationControllerDelegate {
    var userdata : NSDictionary?
    var imagePicker: UIImagePickerController?
    var ref = Database.database().reference()

//IBOulets
    @IBOutlet var taskeeNameTF: UITextField!
    @IBOutlet var taskeeGenderTF: UITextField!
    @IBOutlet var taskeeEmailTF: UITextField!
    @IBOutlet var taskeePhoneTF: UITextField!
    @IBOutlet var taskeeBioTV: UITextView!
    @IBOutlet var taskeeAgeTF: UITextField!
    @IBOutlet var taskeeUsername: UITextField!
    
//Camera
    @IBOutlet var preveiwPFP: UIImageView!
    @IBAction func openCamera(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            imagePicker = UIImagePickerController()
            imagePicker?.delegate = self
            imagePicker?.sourceType = .camera
            imagePicker?.allowsEditing = false
            self.present(imagePicker!, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
//Initial Population of Data
        let firstName = userdata!["firstName"] as! String
        let lastName = userdata!["lastName"] as! String
        let fullname = firstName + " " + lastName
        taskeeNameTF.text = fullname
        taskeeUsername.text = userdata!["username"] as! String
        taskeeGenderTF.text = userdata!["gender"] as! String
        taskeeAgeTF.text = userdata!["age"] as! String
        taskeeEmailTF.text = userdata!["email"] as! String
        taskeePhoneTF.text = userdata!["phoneNumber"] as! String
        taskeeBioTV.text = userdata!["bio"] as! String
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let fullName = taskeeNameTF.text?.components(separatedBy: " ")
        let firstName = fullName?[0]
        let lastName = fullName?[1]
        let gender = taskeeGenderTF.text
        let email = taskeeEmailTF.text
        let phoneNumber = taskeePhoneTF.text
        let bio = taskeeBioTV.text
        let age = taskeeAgeTF.text

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

extension TaskeeEditVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        preveiwPFP.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
