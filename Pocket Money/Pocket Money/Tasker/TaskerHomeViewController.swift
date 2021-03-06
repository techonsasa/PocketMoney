//
//  TaskerHomeViewController.swift
//  Pocket Money
//
//  Created by Sathiyan Kutty on 2/19/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskerHomeViewController: UIViewController, UITableViewDataSource {
    
    var selectedTask : NSDictionary?
    var data = [NSDictionary]()
    var user : String?
    var userName : String?
    var ref : DatabaseReference!
    var userdata: NSDictionary?
    var taskeeData : NSDictionary?

    @IBOutlet weak var tableView4: UITableView!
    
//Table View Populating
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jobCell = tableView.dequeueReusableCell(withIdentifier: "TaskerHomeTableCell", for: indexPath) as! TaskerJobPostingCell
        jobCell.NameOfTask?.text = data[indexPath.row]["jobName"] as? String
        jobCell.Date?.text = data[indexPath.row]["jobDate"] as? String
        jobCell.Time?.text = data[indexPath.row]["jobTime"] as? String
        return jobCell
    }
    
    override func viewDidLoad() {
        tableView4.reloadData()
        super.viewDidLoad()
        tableView4.delegate = self
        tableView4.dataSource = self
        ref = Database.database().reference()
        getDataFromFirebase()
        tableView4.reloadData()
        print(userdata)
    }

    func getDataFromFirebase () {
        let query = ref.child("tasks").queryOrdered(byChild: "taskerName").queryEqual(toValue: user)
        query.observeSingleEvent(of: .value) { (snapshot) in
            var sp = snapshot.value as? NSDictionary
            if (sp == nil) {
                sp = [:]
            }
            for (_, value) in sp!  {
                self.data.append(value as! NSDictionary)
            }
            self.tableView4.reloadData()
        }
    }
    
//Passing Name Variable
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "go to add event") {
            let vc = segue.destination as! AddEventViewController
            vc.user = user
        } else if (segue.identifier == "Tasker Home to Task Info") {
            let vc = segue.destination as! TaskInfo
            vc.taskeeData = taskeeData
            vc.taskData = selectedTask
            vc.taskerData = userdata
        } else if (segue.identifier == "Tasker Home to Applied") {
            let vc = segue.destination as! TaskerAppliedViewController
            vc.taskData = selectedTask
        }
    }
}

extension TaskerHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTask = data[indexPath.row]
        if (selectedTask?["accepted"] != nil) {
            self.performSegue(withIdentifier: "Tasker Home to Task Info", sender: self)
        } else {
            performSegue(withIdentifier: "Tasker Home to Applied", sender: self)
        }
    }
}
