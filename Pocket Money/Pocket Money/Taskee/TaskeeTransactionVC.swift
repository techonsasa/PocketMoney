//
//  TaskeeTransactionVC.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 4/18/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeTransactionVC: UIViewController {
    
    var userdata : NSDictionary?
    var txns = [String]()
    var ref : DatabaseReference!
    var rates = [String]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        getData()
        tableView.dataSource = self
    }
    
    func getData() {
        let transactions = userdata!["transactions"] as? NSDictionary
        for (key, value) in transactions! {
            let taskdata = value as! NSDictionary
            let tasknames = taskdata["taskName"] as! String
            txns.append(tasknames)
            let taskrates = taskdata["taskWage"] as! String
            rates.append(taskrates)
        }
    }
}

extension TaskeeTransactionVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return txns.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskeeTXNCell")!
        let app = txns[indexPath.row]
        cell.textLabel?.text = app
        cell.detailTextLabel?.text = rates[indexPath.row]
        return cell
    }
}
