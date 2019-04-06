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
    var appliedTaskees = [NSDictionary] ()
    
    @IBOutlet weak var tableView5: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView5.dataSource = self
        let applicants = taskData!["applied"] as? NSDictionary
        for (_, value) in applicants! {
            appliedTaskees.append(value as! NSDictionary)
        }
    }
}

extension TaskerAppliedViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView5: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appliedTaskees.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskerAppliedCell")!
        let app = appliedTaskees[indexPath.row]
        cell.textLabel?.text = app["fullName"] as? String
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Taskee Info") {
            let vc = segue.destination as! TaskeeInformation
            vc.userdata = selectedUser
        }
    }
}

extension TaskerAppliedViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userName = appliedTaskees[indexPath.row]["username"] as! String
        let query = ref.child("users").child(userName)
        query.observeSingleEvent(of: .value) { (snapshot) in
            self.selectedUser = snapshot.value as? NSDictionary
            self.performSegue(withIdentifier: "Taskee Info", sender: self)
        }
    }
}
