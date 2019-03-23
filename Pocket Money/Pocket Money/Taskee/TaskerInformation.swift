//
//  Tasker Information.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 3/21/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskerInformation: UIViewController {
    var data : NSDictionary?
    var userdata: NSDictionary?
    
//IBOutlets
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskerName: UILabel!
    @IBOutlet var taskDate: UILabel!
    @IBOutlet var taskWage: UILabel!
    @IBOutlet var taskDescription: UITextView!
    @IBOutlet var taskTime: UILabel!
    
    
    override func viewDidLoad() {
        taskName.text = data!["jobName"] as! String
        taskerName.text = data!["taskerName"] as! String
        taskDate.text = data!["taskeDate"] as! String
        taskTime.text = data!["jobTime"] as! String
        taskWage.text = data!["taskRate"] as! String
        taskDescription.text = data!["jobDescription"] as! String
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Tasker Details to Confirm") {
            let vc = segue.destination as! TaskeeInformationConfirm
            vc.data = data
            vc.userdata = userdata
        }
    }
}
