//
//  TaskeeProfile.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 2/15/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeProfileVC: UIViewController {
    var userdata: NSDictionary?
    
//IBOutlets
    @IBOutlet var taskeeName: UILabel!
    @IBOutlet var taskeeUsername: UILabel!
    @IBOutlet var taskeeGender: UILabel!
    @IBOutlet var taskeeEmail: UILabel!
    @IBOutlet var taskeePhoneNumber: UILabel!
    @IBOutlet var taskeeBio: UITextView!
    @IBOutlet var taskeeAge: UILabel!

    override func viewDidLoad() {
        let firstName = userdata!["firstName"] as! String
        let lastName = userdata!["lastName"] as! String
        let fullname = firstName + " " + lastName
        taskeeName.text = fullname
        taskeeUsername.text = userdata!["username"] as! String
        taskeeGender.text = userdata!["gender"] as! String
        taskeeAge.text = userdata!["age"] as! String
        taskeeEmail.text = userdata!["email"] as! String
        taskeePhoneNumber.text = userdata!["phoneNumber"] as! String
        taskeeBio.text = userdata!["bio"] as! String
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Edit Taskee Segue") {
            let vc = segue.destination as! TaskeeEditVC
            vc.userdata = self.userdata
        }
    }
}
