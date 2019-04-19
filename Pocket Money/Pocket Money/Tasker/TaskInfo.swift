//
//  TaskInfo.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 4/5/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskInfo : UIViewController {
    
    var taskData : NSDictionary?
    var taskerData: NSDictionary?
    var taskeeData: NSDictionary?
    var ref = Database.database().reference()
    
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskeeName: UILabel!
    @IBOutlet var taskWage: UILabel!
    @IBOutlet var taskDate: UILabel!
    @IBOutlet var taskTime: UILabel!
    @IBOutlet var taskDescription: UITextView!
    
    override func viewDidLoad() {
        taskName.text = taskData!["jobName"] as? String
        let taskeeData = taskData!["accepted"] as? NSDictionary
        taskeeName.text = taskeeData!["fullName"] as? String
        taskWage.text = taskData!["taskRate"] as? String
        taskDate.text = taskData!["jobDate"] as? String
        taskTime.text = taskData!["jobTime"] as? String
        taskDescription.text = taskData!["jobDescription"] as? String
        print(taskerData)
    }
    
    @IBAction func taskCompleteButton(_ sender: Any) {
        let taskerName = taskerData!["username"] as! String
        let jobName = taskData!["jobName"] as! String
        let jobRate = taskData!["taskRate"] as! String
        let taskAcceptedData = taskData!["accepted"] as? NSDictionary
        let taskeeName = taskAcceptedData!["userName"] as! String
//get taskee data
        ref.child("users").child(taskeeName).observeSingleEvent(of: .value) { (snapshot) in
            let userData = snapshot.value as! NSDictionary
            gotResultsFromServer(userData: userData)
        }
//update tasker
        let transactionref = ref.child("users").child(taskerName).child("transactions")
        let key = transactionref.childByAutoId().key
        let transactiondata = ["\(key)" : [
            "taskName" : jobName,
            "taskWage" : jobRate
            ]]
        transactionref.updateChildValues(transactiondata)
//update taskee
        let transref = self.ref.child("users").child(taskeeName).child("transactions")
        let transkey = transref.childByAutoId().key
        let data = ["\(transkey)" : [
            "taskName" : jobName,
            "taskWage" : jobRate
            ]]
        transref.updateChildValues(data)
//delete accepted
        ref.child("tasks").child(jobName).child("accepted").removeValue()
        func gotResultsFromServer(userData: NSDictionary) {
            let deletetask = lookupTaskeeKeyValue(taskName: jobName, userData: userData)
        let db = ref.child("users").child(taskeeName).child("accepted")
            db.child(deletetask).removeValue()
            dismiss(animated: true, completion: nil)
        }
// delete taskee accepted
        func lookupTaskeeKeyValue(taskName: String, userData: NSDictionary) -> String {
            let list = userData["accepted"] as! NSDictionary
            let jobName = taskData!["jobName"] as! String
            for (key, value) in list {
                let taskname = value as! String
                if (taskname == jobName){
                    return key as! String
                }
            }
            return ""
        }
    }
    
    @IBAction func backToHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
