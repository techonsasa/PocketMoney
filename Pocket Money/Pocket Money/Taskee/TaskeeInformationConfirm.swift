//
//  TaskeeInformationConfirm.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 3/22/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeInformationConfirm: UIViewController {
    var userdata: NSDictionary?
    var data: NSDictionary?
    var ref = Database.database().reference()
    
    @IBOutlet var taskeeName: UILabel!
    @IBOutlet var taskeeUsername: UILabel!
    @IBOutlet var taskeeGender: UILabel!
    @IBOutlet var taskeeAge: UILabel!
    @IBOutlet var taskeeEmail: UILabel!
    @IBOutlet var taskeeNumber: UILabel!
    @IBOutlet var taskeeBio: UITextView!
    @IBOutlet var taskName: UILabel!
    
    override func viewDidLoad() {
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
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Applicant Info to Confirm") {
            let vc = segue.destination as! TaskeeConfirmed
            vc.data = data
            vc.userdata = userdata
        }
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        let username = userdata!["username"] as! String
        let firstName = userdata!["firstName"] as! String
        let lastName = userdata!["lastName"] as! String
        let fullname = firstName + " " + lastName
        let taskName = data!["jobName"] as! String
//update taskee
        let appliedref = self.ref.child("users").child(username).child("applied")
        let key = appliedref.childByAutoId().key
        let appliedata = ["\(key)": taskName]
        appliedref.updateChildValues(appliedata)
//update task
        let tasksref = self.ref.child("tasks").child(taskName).child("applied")
        let taskKey = tasksref.childByAutoId().key
        let taskApplied = ["\(taskKey)": [
            "fullName": fullname,
            "username" : username]]
        tasksref.updateChildValues(taskApplied)
    }
}

