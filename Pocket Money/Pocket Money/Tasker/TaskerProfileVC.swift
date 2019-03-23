//
//  TaskerProfileVC.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 3/15/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskerProfileVC: UIViewController {
    var userdata: NSDictionary?
    
//IBOutlets
    @IBOutlet var taskerName: UILabel!
    @IBOutlet var taskerUsername: UILabel!
    @IBOutlet var taskerGender: UILabel!
    @IBOutlet var taskerAge: UILabel!
    @IBOutlet var taskerEmail: UILabel!
    @IBOutlet var taskerPhone: UILabel!
    @IBOutlet var taskerBio: UITextView!
    
    override func viewDidLoad() {
        let firstName = userdata!["firstName"] as! String
        let lastName = userdata!["lastName"] as! String
        let fullname = firstName + " " + lastName
        taskerName.text = fullname
        taskerUsername.text = userdata!["username"] as! String
        taskerGender.text = userdata!["gender"] as! String
        taskerAge.text = userdata!["age"] as! String
        taskerEmail.text = userdata!["email"] as! String
        taskerPhone.text = userdata!["phoneNumber"] as! String
        taskerBio.text = userdata!["bio"] as! String
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Edit Tasker Segue") {
            let vc = segue.destination as! TaskeeEditVC
            vc.userdata = self.userdata
        }
    }
}
