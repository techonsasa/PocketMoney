//
//  SignupTaskerViewController.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 12/21/18.
//  Copyright © 2018 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import firebase

class SignupTaskerViewController: UIViewController {
    var genders: [String] = ["Male", "Female"]
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agePicker.delegate = self
        genderPicker.delegate = self
        
        ref = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func donePressed(_ sender: AnyObject) {
        ref?.child("users").setValue(["username" : usernameTextField.text])
        ref?.child("users").child("username").setValue(["password" : passwordTextField.text])
        
        //        ref?.child("users").setValue(["password" : passwordTextField.text])
        //        ref?.child("users").setValue(["firstName" : firstNameTextField.text])
        //        ref?.child("users").setValue(["lastName" : lastNameTextField.text])
        //        ref?.child("users").setValue(["email" : emailTextField.text])
        //        ref?.child("users").setValue(["phoneNumber" : phoneTextField.text])
        
    }
}

//Picker Views

extension SignupTaskerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(genders[row])
    }
}

