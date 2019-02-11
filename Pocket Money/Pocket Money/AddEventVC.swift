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
    
    @IBAction func addEvent(_ sender: Any) {
        let vjobName = jobName.text
        let vjobDescription = jobDescription.text
        
        let data =
            [vjobName:
                ["jobName" : vjobName,
                 "jobDescription" : vjobDescription
                ]
        
        ]
        
        ref?.child("tasks").updateChildValues(data)
        
    }
}
