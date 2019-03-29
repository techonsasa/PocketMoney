//
//  TaskeeConfirmed.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 3/22/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeConfirmed : UIViewController {
    var data: NSDictionary?
    var userdata: NSDictionary?
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Back to Home") {
            let tabvc = segue.destination as! UITabBarController
            let vc = tabvc.viewControllers?[0] as? TaskeeHomeScreenVC
            vc?.userdata = userdata
            let profilevc = tabvc.viewControllers?[3] as? TaskeeProfileVC
            profilevc?.userdata = userdata
        }
    }
}
