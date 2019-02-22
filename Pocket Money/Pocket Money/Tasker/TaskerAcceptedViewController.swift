//
//  TaskerAcceptedViewController.swift
//  Pocket Money
//
//  Created by Sathiyan Kutty on 2/19/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskerAcceptedViewController: UIViewController {

    @IBOutlet weak var tableView6: UITableView!
    
        var txns = [(tasker: "Patience Stromberg", rating:"4.5"),
                    (tasker: "Vonnie Heintzelman", rating:"5.0"),
                    (tasker: "Audria Yount", rating:"3.5"),
                    (tasker: "David Mcneely", rating:"3.0"),
                    (tasker: "Teisha Kanne", rating:"4.2"),
                    (tasker: "Jay Mccloy", rating:"3.8"),
                    (tasker: "Mark Russo", rating:"4.7"),
                    (tasker: "Carmelita Focht", rating:"4.9"),
                    ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView6.dataSource = self
            
        }
        //TaskerAppliedCell
    }
    
    extension TaskerAcceptedViewController: UITableViewDataSource
    {
        
        func numberOfSections(in tableView6: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // return tasks.count
            //  return apps.count
            return txns.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskerAcceptedCell")!
            
            let app = txns[indexPath.row]
            cell.textLabel?.text=app.tasker
            cell.detailTextLabel?.text=app.rating
            
            
            //        let app = tasks[indexPath.row]
            //        let amt = amounts[indexPath.row]
            //        cell.textLabel?.text=app
            //        cell.detailTextLabel?.text=amt
            
            //        let app=apps[indexPath.row]
            //        print (app)
            //        cell.textLabel?.text=app.name
            
            return cell
            
        }
}
