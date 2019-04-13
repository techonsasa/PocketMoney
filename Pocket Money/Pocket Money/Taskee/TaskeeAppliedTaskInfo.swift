//
//  TaskeeAppliedTaskInfo.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 4/13/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeAppliedTaskInfo: UIViewController {
    
    var taskData : NSDictionary?
    
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskerName: UILabel!
    @IBOutlet var taskWage: UILabel!
    @IBOutlet var taskTime: UILabel!
    @IBOutlet var TaskDescription: UITextView!
    @IBOutlet var taskDate: UILabel!
    
    override func viewDidLoad() {
        taskName.text = taskData!["jobName"] as! String
        taskerName.text = taskData!["taskerName"] as! String
        taskWage.text = taskData!["taskRate"] as! String
        taskTime.text = taskData!["jobTime"] as! String
        TaskDescription.text = taskData!["jobDescription"] as! String
        taskDate.text = taskData!["taskeDate"] as! String
    }
    
    @IBAction func okayButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
