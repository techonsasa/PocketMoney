//
//  TaskeeAcceptedViewController.swift
//  Pocket Money
//

//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskeeAcceptedViewController: UIViewController {

    
    @IBOutlet weak var tableView3: UITableView!
    
    var txns = [(task: "PC Support", taskdate:"1/1/2019"),
                (task: "Petsitting", taskdate:"1/12/2019"),
                (task: "Gift Wrapping", taskdate:"1/14/2019"),
                (task: "Flower Arrangement", taskdate:"1/26/2019"),
                (task: "Coding", taskdate:"1/30/2019"),
                
                ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
          tableView3.dataSource = self
    }
}

extension TaskeeAcceptedViewController: UITableViewDataSource
{
    
    func numberOfSections(in tableView3: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return tasks.count
        //  return apps.count
        return txns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskeeAcceptedCell")!
        
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
