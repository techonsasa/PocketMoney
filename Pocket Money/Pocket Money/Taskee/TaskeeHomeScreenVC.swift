//
//  TaskeeHomeScreenVC.swift
//  Pocket Money
//
//  Created by Sharra Kutty on 1/25/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class TaskeeHomeScreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var names = ["Mohan Goyal", "Seth Kutty", "Mike Russo", "Christina James"]
    var taskTime = ["11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM"]
    
    var data = [NSDictionary]()
    var ref : DatabaseReference!
    
    @IBOutlet weak var jobPostingTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jobCell = tableView.dequeueReusableCell(withIdentifier: "jobPostingCell", for: indexPath) as! TaskeeJobPostingCell
//        jobCell.nameInputText.text = names[indexPath.row][""]
        jobCell.nameOfTask.text = data[indexPath.row]["jobName"] as! String
//        jobCell.timeOfTask.text = data[indexPath.row]
        return jobCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(data[indexPath.row])
    }
    
    @IBOutlet weak var btnMessage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobPostingTableView.delegate = self
        jobPostingTableView.dataSource = self
        self.applyRoundCorners(btnMessage)
        ref = Database.database().reference()
        getDataFromFirebase()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        jobPostingTableView.estimatedRowHeight = 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func applyRoundCorners(_ object:AnyObject )  {
        
        object.layer.cornerRadius = object.frame.size.width / 2
        object.layer.masksToBounds = true
    }
    
    func getDataFromFirebase () {
        ref.child("tasks").observeSingleEvent(of: .value, with: { (snapshot) in
            let spvalue = snapshot.value as? NSDictionary
            for (key, value) in spvalue! {
                print ("Value : \(value) for key: \(key)")
                self.data.append(value as! NSDictionary)
            }
            
            print(self.data)
            self.jobPostingTableView.reloadData()
        })
        
    }
    
    
}
