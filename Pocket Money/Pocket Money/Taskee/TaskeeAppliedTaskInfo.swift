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
        print(taskData)
    }
}
