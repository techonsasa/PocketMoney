//
//  TaskeeAppliedViewController.swift
//  Pocket Money
//
//  Created by Sathiyan Kutty on 2/18/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskeeAppliedViewController: UIViewController {

    @IBOutlet weak var tableView2: UITableView!
    
    var txns = [(task: "Gift Wrapping", taskdate:"2/1/2019"),
                (task: "Petsitting", taskdate:"2/2/2019"),
                (task: "Coding", taskdate:"2/4/2019"),
                (task: "PC Support", taskdate:"2/7/2019"),
                (task: "Flower Arrangement", taskdate:"2/10/2019"),
 
                ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView2.dataSource = self
    }

}

extension TaskeeAppliedViewController: UITableViewDataSource
{
    
    func numberOfSections(in tableView2: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return tasks.count
        //  return apps.count
        return txns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskeeAppliedCell")!
        
        let app = txns[indexPath.row]
     cell.textLabel?.text=app.task
cell.detailTextLabel?.text=app.taskdate
       // cell.label
//        taskername.text=app.tasker
//        taskdate.text=app.amount
        
        
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
