//
//  TaskeeTXNViewController.swift
//  
//
//  Created by Sathiyan Kutty on 2/18/19.
//

import UIKit

class TaskeeTXNViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var tasks = ["Mohan Goyal", "Seth Kutty","Hello Kitty","Bill Gates","Mark Zuckerberg","Lavina Mehta","Mark Russo","Captain America"]
    var amounts = ["$200","$300","$120","$50","$1","$30","$10","$40"]
    
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
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
     let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell")!
     let app = tasks[indexPath.row]
     let amt = amounts[indexPath.row]
     print (app)
     cell.textLabel?.text=app
     cell.detailTextLabel?.text=amt

    return cell
    
    }
}
