//
//  SignupTaskeeViewController.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 12/21/18.
//  Copyright © 2018 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class SignupTaskeeViewController: UIViewController {
    var genders: [String] = ["Male", "Female"]
    var ages: [String] = ["13", "14", "15", "16", "17", "18"]
    var ref: DatabaseReference?

//IBOutlets
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var agePicker: UIPickerView!
    @IBOutlet var genderPicker: UIPickerView!
    @IBOutlet var bioTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agePicker.delegate = self
        genderPicker.delegate = self

        ref = Database.database().reference()
    }
    
//Saving to Firebase
    
    @IBAction func donePressed(_ sender: Any) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let email = emailTextField.text
        let phoneNumber = phoneNumberTextField.text
        let age = ages[agePicker.selectedRow(inComponent: 0)]
        let gender = genders[genderPicker.selectedRow(inComponent: 0)]
        let bio = bioTextField.text
        
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
                 "group" : "taskee",
                 "bio" : bio
                ]
        ]
        
        ref?.child("users").updateChildValues(data)
        
    }
}

//Picker Views

extension SignupTaskeeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
