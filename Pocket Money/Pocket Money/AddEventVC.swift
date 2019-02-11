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
    
    @IBOutlet var jobName: UITextField!
    @IBOutlet var jobDescription: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }
    
    
//    @IBOutlet var jobDate: UIDatePicker!
    
    @IBAction func addEventPressed(_ sender: Any) {
        let vjobName = jobName.text
        let vjobDescription = jobDescription.text
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let result = formatter.string(from: date)
        
        print("Success!")
        let data =
            [vjobName:
                ["jobName" : vjobName,
                 "jobDescription" : vjobDescription,
                    "taskerName" : "hello",
                    "jobDate" : "1/2/2019",
                    "jobTime" : "1200 pm",
                    "createDate" : result
                ]
                
        ]
        
        ref?.child("tasks").updateChildValues(data)
    }
    
    

    

}
