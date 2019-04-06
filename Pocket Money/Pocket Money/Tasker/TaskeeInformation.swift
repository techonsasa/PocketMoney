//
//  TaskeeInformation.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 4/4/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskeeInformation : UIViewController {
    
    var userdata : NSDictionary?
    
    override func viewDidLoad() {
        print(userdata)
    }
    
    @IBOutlet var taskeeName: UILabel!
    @IBOutlet var taskeeGender: UILabel!
    @IBOutlet var taskeeAge: UILabel!
    @IBOutlet var taskeeEmail: UILabel!
    @IBOutlet var taskeeNumber: UILabel!
    @IBOutlet var taskeeBio: UITextView!
    @IBAction func acceptPressed(_ sender: Any) {
    }
}
