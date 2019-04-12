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
    
    var taskdata : NSDictionary?
    var taskerFullname : String?
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "TaskeeAcceptedToHome") {
            let tabvc = segue.destination as! UITabBarController
            let vc = tabvc.viewControllers?[0] as! TaskerHomeViewController
            let pvc = tabvc.viewControllers?[2] as! TaskerProfileVC
            vc.userdata = userdata
            pvc.userdata = userdata
            vc.user = taskerFullname
        }
    }

    @IBAction func acceptPressed(_ sender: Any) {
        let taskName = taskdata!["jobName"] as! String
        let userName = userdata!["username"] as! String
        let userref = ref?.child("users").child(userName).child("accepted")
        let key = userref?.childByAutoId().key as! String
        let data = [
            "fullName" : fullName,
            "userName" : userName
                ]
        ref?.child("tasks").child(taskName).child("accepted").updateChildValues(data)
    ref?.child("users").child(userName).child("accepted").child(key).updateChildValues(["taskName": taskName])
        let deletekey = lookupKeyValue(taskName: taskName)
        ref?.child("users").child(userName).child("applied").child(deletekey).removeValue()
    }
    
    func lookupKeyValue(taskName: String) -> String {
        let list = userdata!["applied"] as? NSDictionary
        for (key, value) in list! {
            let taskname = value as! String
            if (taskname == taskName) {
                return key as! String
            }
        }
        return ""
    }
}
