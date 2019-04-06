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
    
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskeeName: UILabel!
    @IBOutlet var taskWage: UILabel!
    @IBOutlet var taskDate: UILabel!
    @IBOutlet var taskTime: UILabel!
    @IBOutlet var taskDescription: UITextView!
    
    override func viewDidLoad() {
        taskName.text = taskData!["jobName"] as? String
        taskeeName.text = taskData!["accepted"] as? String
        taskWage.text = taskData!["taskRate"] as? String
        taskDate.text = taskData!["taskeDate"] as? String
        taskTime.text = taskData!["jobTime"] as? String
        taskDescription.text = taskData!["jobDescription"] as? String
    }
    
    @IBAction func okayButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
