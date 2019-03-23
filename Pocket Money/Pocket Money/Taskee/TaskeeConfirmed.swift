//
//  TaskeeConfirmed.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 3/22/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
//import Firebase

class TaskeeConfirmed : UIViewController {
    var data: NSDictionary?
    var userdata: NSDictionary?
    
    override func viewDidLoad() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Applicant Info to Confirm") {
            let vc = segue.destination as! TaskeeInformationConfirm
            vc.data = data
            vc.userdata = userdata
        }
    }
}
