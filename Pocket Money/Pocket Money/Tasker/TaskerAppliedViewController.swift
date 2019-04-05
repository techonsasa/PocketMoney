//
//  TaskerAppliedViewController.swift
//  Pocket Money
//
//  Created by Sathiyan Kutty on 2/19/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskerAppliedViewController: UIViewController {

    var selectedUser : NSDictionary?
    var taskData : NSDictionary?
    var ref = Database.database().reference()
    
    @IBOutlet weak var tableView5: UITableView!

    var txns = [NSDictionary] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView5.dataSource = self
        let applicants = taskData!["applied"] as? NSDictionary
        for (_, value) in applicants! {
            txns.append(value as! NSDictionary)
            print(value)
        }
    }
//TaskerAppliedCell    
}

extension TaskerAppliedViewController: UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView5: UITableView, numberOfRowsInSection section: Int) -> Int {
        return txns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskerAppliedCell")!
        
        let app = txns[indexPath.row]
        cell.textLabel?.text = app["fullName"] as? String
//        cell.detailTextLabel?.text=app.amount
        
        
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

extension TaskerAppliedViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userName = txns[indexPath.row]["username"] as! String
        let query = ref.child("users").child(userName)
        query.observeSingleEvent(of: .value) { (snapshot) in
            self.selectedUser = snapshot.value as? NSDictionary
            self.performSegue(withIdentifier: "Taskee Info", sender: self)
        }
    }
}
