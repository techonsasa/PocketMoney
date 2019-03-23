//
//  TaskeeInformationConfirm.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 3/22/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskeeInformationConfirm: UIViewController {
    var userdata: NSDictionary?
    var data: NSDictionary?
    
    @IBOutlet var taskeeName: UILabel!
    @IBOutlet var taskeeUsername: UILabel!
    @IBOutlet var taskeeGender: UILabel!
    @IBOutlet var taskeeAge: UILabel!
    @IBOutlet var taskeeEmail: UILabel!
    @IBOutlet var taskeeNumber: UILabel!
    @IBOutlet var taskeeBio: UITextView!
    @IBOutlet var taskName: UILabel!
    
    override func viewDidLoad() {
        print(userdata)
        let firstName = userdata!["firstName"] as! String
        let lastName = userdata!["lastName"] as! String
        let name = firstName + " " + lastName
        taskeeName.text = name
        taskeeUsername.text = userdata!["username"] as! String
        taskeeGender.text = userdata!["gender"] as! String
        taskeeAge.text = userdata!["age"] as! String
        taskeeEmail.text = userdata!["email"] as! String
        taskeeBio.text = userdata!["bio"] as! String
        taskName.text = data!["jobName"] as! String
    }
    
    
}

