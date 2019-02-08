//
//  LoginViewController.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 12/21/18.
//  Copyright © 2018 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBAction func signInButton(_ sender: Any) {
        
        if let username = usernameTextField.text {
            ref.child("users").child(username).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary ?? [:]
                print(value)
                self.checkPassword(value: value)
                })
        }
        
    }
    
    
    func checkPassword (value: NSDictionary) {
        let password = value["password"] as? String ?? ""
        let group = value["group"] as? String ?? ""
        if (passwordTextField.text == password && group == "Tasker") {
            performSegue(withIdentifier: "Login to Tasker Home", sender: self)
        }
    }
    
}
