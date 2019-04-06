//
//  TaskeeInformation.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 4/4/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeInformation : UIViewController {
    
    var userdata : NSDictionary?
    var fullName : String?
    var ref: DatabaseReference?
    
    @IBOutlet var taskeeName: UILabel!
    @IBOutlet var taskeeGender: UILabel!
    @IBOutlet var taskeeAge: UILabel!
    @IBOutlet var taskeeEmail: UILabel!
    @IBOutlet var taskeeNumber: UILabel!
    @IBOutlet var taskeeBio: UITextView!
    
    override func viewDidLoad() {
        let firstName = userdata!["firstName"] as? String
        let lastName = userdata!["lastName"] as? String
        fullName = firstName! + " " + lastName!
        taskeeName.text = fullName
        taskeeGender.text = userdata!["gender"] as? String
        taskeeAge.text = userdata!["age"] as? String
        taskeeEmail.text = userdata!["email"] as? String
        taskeeNumber.text = userdata!["phoneNumber"] as? String
        taskeeBio.text = userdata!["bio"] as? String
        ref = Database.database().reference()
    }

    @IBAction func acceptPressed(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
    }
}
