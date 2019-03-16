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
    
    var datePickerValue: String = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
    var ref: DatabaseReference?
    var user: String?
    
    @IBOutlet var jobName: UITextField!
    @IBOutlet var jobDescription: UITextField!
    @IBOutlet var additionalDates: UITextField!
    @IBOutlet var hourlyRate: UITextField!
    @IBOutlet var taskDatePicker: UIDatePicker!
    @IBOutlet var time: UITextField!
    
    
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
        let additionalTaskDate = additionalDates.text
        let taskRate = hourlyRate.text
        let taskTime = time.text
        
        print("Success!")
        let data =
            [vjobName:
                ["jobName" : vjobName,
                 "jobDescription" : vjobDescription,
                 "taskerName" : user!,
                 "jobDate" : datePickerValue,
                 "jobTime" : "1200 pm",
                 "createDate" : result,
                 "additionalTaskDate" : additionalTaskDate,
                 "taskRate" : taskRate,
                 "taskTime" : taskTime
                ]
            ]
        
        ref?.child("tasks").updateChildValues(data)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishDatePicking(_ sender: UIDatePicker) {
        datePickerValue = DateFormatter.localizedString(from: sender.date, dateStyle: .short
            , timeStyle: .none)
    }
}

