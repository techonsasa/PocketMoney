//
//  TaskeeProfile.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 2/15/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeProfileVC: UIViewController {
    var userdata: NSDictionary?
    
//IBOutlets
    @IBOutlet var taskeeName: UILabel!
    @IBOutlet var taskeeUsername: UILabel!
    @IBOutlet var taskeeGender: UILabel!
    @IBOutlet var taskeeEmail: UILabel!
    @IBOutlet var taskeePhoneNumber: UILabel!
    

    override func viewDidLoad() {
        print ("ProfileVC: \(userdata)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Edit Taskee Segue") {
            let vc = segue.destination as! TaskeeEditVC
            vc.userdata = self.userdata
        }
    }
}
