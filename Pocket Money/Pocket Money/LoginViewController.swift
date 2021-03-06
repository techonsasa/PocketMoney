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
    var data: NSDictionary?
    var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBAction func signInButton(_ sender: Any) {
        if let username = usernameTextField.text {
            ref.child("users").child(username).observeSingleEvent(of: .value, with: { (snapshot) in
                self.data = snapshot.value as? NSDictionary ?? [:]
                self.loginCheck(value: self.data!)
                })
        }
    }
    
    func loginCheck (value: NSDictionary) {
        let password = value["password"] as? String ?? ""
        let group = value["group"] as? String ?? ""
        if (passwordTextField.text == password && group == "tasker") {
            performSegue(withIdentifier: "Login to Tasker Home", sender: self)
        } else if (passwordTextField.text == password && group == "taskee") {
            performSegue(withIdentifier: "Login to Taskee Home", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstName = data?["firstName"] as? String
        let lastName = data?["lastName"] as? String
        let name = (firstName ?? "Hello") + " " + (lastName ?? "World")
        let username = data?["username"] as? String
        if (segue.identifier == "Login to Tasker Home"){
            let tabvc = segue.destination as! UITabBarController
            let vc = tabvc.viewControllers?[0] as? TaskerHomeViewController
            vc?.user = name
            vc?.userName = username
        }
        if (segue.identifier == "Login to Taskee Home"){
            let tabvc = segue.destination as! UITabBarController
            let vc = tabvc.viewControllers?[0] as? TaskeeHomeScreenVC
            vc?.userdata = self.data
            let profilevc = tabvc.viewControllers?[3] as? TaskeeProfileVC
            profilevc?.userdata = self.data
            let appliedvc = tabvc.viewControllers?[1] as? TaskeeAppliedViewController
            appliedvc?.userdata = self.data
            let transactionvc = tabvc.viewControllers?[2] as? TaskeeTransactionVC
            transactionvc?.userdata = self.data
        }
        if (segue.identifier == "Login to Tasker Home"){
            let tabvc = segue.destination as! UITabBarController
            let vc = tabvc.viewControllers?[0] as? TaskerHomeViewController
            vc?.userdata = self.data
            let profilevc = tabvc.viewControllers?[2] as? TaskerProfileVC
            profilevc?.userdata = self.data
            let transactionvc = tabvc.viewControllers?[1] as? TaskerTransactionVC
            transactionvc?.userdata = self.data
        }
    }
}

