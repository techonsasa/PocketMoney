//
//  TaskeeHomeScreenVC.swift
//  Pocket Money
//
//  Created by Sharra Kutty on 1/25/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import Foundation
import UIKit

class TaskeeHomeScreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var names = ["lorman", "sharra", "bill", "bob"]

    var taskTime = ["11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM"]
    
    @IBOutlet weak var jobPostingTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jobCell = tableView.dequeueReusableCell(withIdentifier: "jobPostingCell", for: indexPath) as! JobPostingCell
//        jobCell.nameInputText.text = names[indexPath.row]
        jobCell.nameOfTask.text = names[indexPath.row]
        jobCell.timeOfTask.text = taskTime[indexPath.row]
        return jobCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(names[indexPath.row])
    }
    
    @IBOutlet weak var btnMessage: UIButton!
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Identifier", for: indexPath) as! CustomTableViewCell
//        cell.vwCard.sizeToFit()
//        cell.vwCard.layoutIfNeeded()
//        return cell
//    }

    
//    jobPostingTableView.estimatedRowHeight = 100
//    jobPostingTableView.rowHeight = UITableViewAutomaticDimension

//        override func viewWillAppear(_ animated: Bool) {
//        jobPostingTableView.estimatedRowHeight = 100
//        jobPostingTableView.rowHeight = UITableView.automaticDimension
//    }




    override func viewDidLoad() {
        super.viewDidLoad()
        jobPostingTableView.delegate = self
        jobPostingTableView.dataSource = self
        self.applyRoundCorners(btnMessage)
        
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func applyRoundCorners(_ object:AnyObject )  {
        
        object.layer.cornerRadius = object.frame.size.width / 2
        object.layer.masksToBounds = true
    }
    
    
}
