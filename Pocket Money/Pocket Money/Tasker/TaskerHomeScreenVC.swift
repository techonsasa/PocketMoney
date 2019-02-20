//
//  TaskerHomeScreenVC.swift
//  Pocket Money
//
//  Created by Sharra Kutty on 2/8/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskerHomeScreenVC : UIViewController {

//    var names = ["lorman", "sharra", "bill", "bob"]
//    var taskTime = ["11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM"]

   // @IBOutlet weak var tableView4: UITableView!
    
    @IBOutlet weak var tableView4: UITableView!
    
    var txns = [(tasker: "Patience Stromberg", amount:"$20"),
                (tasker: "Vonnie Heintzelman", amount:"$30"),
                (tasker: "Audria Yount", amount:"$100"),
                (tasker: "David Mcneely", amount:"$50"),
                (tasker: "Teisha Kanne", amount:"$20"),
                (tasker: "Jay Mccloy", amount:"$30"),
                (tasker: "Mark Russo", amount:"$10"),
                (tasker: "Carmelita Focht", amount:"$40"),
                ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView4.dataSource = self
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return txns.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let jobCell2 = tableView.dequeueReusableCell(withIdentifier: "jobPostingCell2", for: indexPath) as! TaskerJobPostingCell
//        jobCell2.taskerHomeNameOfTask.text = names[indexPath.row]
//        jobCell2.taskerHomeTimeOfTask.text = taskTime[indexPath.row]
//        return jobCell2
//
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(names[indexPath.row])
//    }
//
//

}

//
//extension TaskerHomeScreenVC: UITableViewDataSource
//{
//
//    func numberOfSections(in tableView4: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // return tasks.count
//        //  return apps.count
//        return txns.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskerHomeTableCell")!
//
//        let app = txns[indexPath.row]
//        cell.textLabel?.text=app.tasker
//        cell.detailTextLabel?.text=app.amount
//
//
//        //        let app = tasks[indexPath.row]
//        //        let amt = amounts[indexPath.row]
//        //        cell.textLabel?.text=app
//        //        cell.detailTextLabel?.text=amt
//
//        //        let app=apps[indexPath.row]
//        //        print (app)
//        //        cell.textLabel?.text=app.name
//
//        return cell
//
//    }
//}

