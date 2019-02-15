//
//  TaskerHomeScreenVC.swift
//  Pocket Money
//
//  Created by Sharra Kutty on 2/8/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskerHomeScreenVC : UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    var names = ["lorman", "sharra", "bill", "bob"]
    
    var taskTime = ["11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM"]
  
    
    @IBOutlet weak var jobPostingTableView2: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jobCell2 = tableView.dequeueReusableCell(withIdentifier: "jobPostingCell2", for: indexPath) as! JobPostingCell2
        jobCell2.nameOfTask2.text = names[indexPath.row]
        jobCell2.timeOfTask2.text = taskTime[indexPath.row]
        return jobCell2
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(names[indexPath.row])
    }

  

}
