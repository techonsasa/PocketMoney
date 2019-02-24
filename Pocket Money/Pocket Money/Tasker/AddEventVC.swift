//
//  AddEventVC.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 2/10/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AddEventViewController: UIViewController {
    
    var ref: DatabaseReference?
    var user: String?
    
    @IBOutlet var jobName: UITextField!
    @IBOutlet var jobDescription: UITextField!
    @IBOutlet var additionalDates: UITextField!
    @IBOutlet var hourlyRate: UITextField!
    @IBOutlet var taskDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }
    
    
//    @IBOutlet var jobDate: UIDatePicker!
    
    @IBAction func addEventPressed(_ sender: Any) {
        let vjobName = jobName.text
        let vjobDescription = jobDescription.text
//Create Date
        let createDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let result = formatter.string(from: createDate)
        let taskDate = additionalDates.text
        let taskRate = hourlyRate.text
        
        print("Success!")
        let data =
            [vjobName:
                ["jobName" : vjobName,
                 "jobDescription" : vjobDescription,
                 "taskerName" : user!,
                 "jobDate" : "1/2/2019",
                 "jobTime" : "1200 pm",
                 "createDate" : result,
                 "taskeDate" : taskDate,
                 "taskRate" : taskRate
                ]
            ]
        
        ref?.child("tasks").updateChildValues(data)
    }
}

//Date Picker View
