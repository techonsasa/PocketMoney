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
    
    var ref: DatabaseReference!
    var data: NSDictionary?
    
//IBOutlets
    @IBOutlet var taskeeName: UILabel!
    @IBOutlet var taskeeUsername: UILabel!
    @IBOutlet var taskeeGender: UILabel!
    @IBOutlet var taskeeEmail: UILabel!
    @IBOutlet var taskeePhoneNumber: UILabel!
    

    override func viewDidLoad() {
        ref = Database.database().reference()
        getProfile(username: "purple")
    }
    
    func getProfile(username: String) {
        ref.child("users").queryEqual(toValue: username)
        .observeSingleEvent(of: .value) { (snapshot) in
            self.data = snapshot as? NSDictionary
            print("Profile: \(self.data)")
        }
    }
}
