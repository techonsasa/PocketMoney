//
//  TaskeeTXNViewController.swift
//  
//
//  Created by Sharra Kutty on 2/18/19.
//

import UIKit

class TaskeeTXNViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

//    var tasks = ["Patience Stromberg", "Vonnie Heintzelman","Audria Yount","David Mcneely","Teisha Kanne","Jay Mccloy","Mark Russo","Carmelita Focht"]
//    var amounts = ["$20","$30","$100","$50","$20","$30","$10","$40"]
    
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

        tableView.dataSource = self
    }

  
}

extension TaskeeTXNViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return txns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
     let cell = tableView.dequeueReusableCell(withIdentifier: "TaskeeTXNCell")!

        let app = txns[indexPath.row]
        cell.textLabel?.text=app.tasker
        cell.detailTextLabel?.text=app.amount

//    let app = tasks[indexPath.row]
//     let amt = amounts[indexPath.row]
//     print (app)
//     cell.textLabel?.text=app
//     cell.detailTextLabel?.text=amt

    return cell
    
    }
}
