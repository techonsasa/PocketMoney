//
//  TaskerAppliedViewController.swift
//  Pocket Money
//
//  Created by Sathiyan Kutty on 2/19/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskerAppliedViewController: UIViewController {

    @IBOutlet weak var tableView5: UITableView!

    
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

        tableView5.dataSource = self
        
    }
//TaskerAppliedCell    
}

extension TaskerAppliedViewController: UITableViewDataSource
{
    
    func numberOfSections(in tableView5: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return tasks.count
        //  return apps.count
        return txns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskerAppliedCell")!
        
        let app = txns[indexPath.row]
        cell.textLabel?.text=app.tasker
        cell.detailTextLabel?.text=app.amount
        
        
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
