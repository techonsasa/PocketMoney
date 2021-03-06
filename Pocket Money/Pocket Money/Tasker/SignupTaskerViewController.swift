//
//  SignupTaskerViewController.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 12/21/18.
//  Copyright © 2018 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class SignupTaskerViewController: UIViewController {
    var genders: [String] = ["Male", "Female"]
    var ages: [String] = ["19-21", "22-30","30-45","45-60","65+"]
    var ref: DatabaseReference?
    
// IBOutlets
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordCheckTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var agePicker: UIPickerView!
    @IBOutlet var genderPicker: UIPickerView!
    @IBOutlet var bioTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agePicker.delegate = self
        genderPicker.delegate = self
        ref = Database.database().reference()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//Saving to Firebase
    @IBAction func donePressed(_ sender: AnyObject) {
        let username = usernameTextField.text
        let password = passwordTextField.text
//        let checkpass = passwordCheckTextField.text
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let email = emailTextField.text
        let phoneNumber = phoneTextField.text
        let age = ages[agePicker.selectedRow(inComponent: 0)]
        let gender = genders[genderPicker.selectedRow(inComponent: 0)]
        let bio = bioTextField.text

//What Saves to Database
        let data =
            [username:
                ["username" : username,
                "password" : password,
                "firstName" : firstName,
                "lastName" : lastName,
                "email" : email,
                "phoneNumber" : phoneNumber,
                "age" : age,
                "gender" : gender,
                "group" : "tasker",
                "bio" : bio
                ]
            ]
        
        ref?.child("users").updateChildValues(data)
    }
}

//Picker Views
extension SignupTaskerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.accessibilityIdentifier == "genderPickerView") {
            return genders.count
        } else {
            return ages.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.accessibilityIdentifier == "genderPickerView") {
            return genders[row]
        } else {
            return ages[row]
        }
    }
}

