//
//  TaskeeAppliedViewController.swift
//  Pocket Money
//
//  Created by Sathiyan Kutty on 2/18/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeAppliedViewController: UIViewController {
    
    var userdata : NSDictionary?
    var txns = [String]()
    var ref : DatabaseReference!
    var taskData : NSDictionary?
    var spvalue : NSDictionary?
    var selectedData : String?

    @IBOutlet var appliedAccepted: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference()
        getData()
        getDataFromFirebase()
    }
    
    func getData() {
        let taskNames = userdata!["applied"] as? NSDictionary
        if let tasknames = taskNames {
            for (_, value) in tasknames {
                txns.append(value as! String)
            }
        }
    }
    
    func getDataFromFirebase () {
        ref.child("tasks").observeSingleEvent(of: .value, with: { (snapshot) in
            self.spvalue = snapshot.value as! NSDictionary
            })
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Applied to Accepted") {
            let vc = segue.destination as! TaskeeAcceptedViewController
            vc.userdata = userdata
            vc.delegate = self
        }
        if (segue.identifier == "Applied to Task Info") {
            let vc = segue.destination as! TaskeeAppliedTaskInfo
            vc.taskData = spvalue![selectedData] as! NSDictionary
        }
    }
}

extension TaskeeAppliedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData = txns[indexPath.row]
        performSegue(withIdentifier: "Applied to Task Info", sender: self)
    }
}

extension TaskeeAppliedViewController: UITableViewDataSource {
    func numberOfSections(in tableView2: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return txns.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskeeAppliedCell")!

        let app = txns[indexPath.row]
        cell.textLabel?.text = app

        return cell
    }
}

extension TaskeeAppliedViewController: SwitchingTabsDelegate {
    func onSwitchBack() {
        appliedAccepted.selectedSegmentIndex = 0
    }
}

protocol SwitchingTabsDelegate {
    func onSwitchBack()
}
