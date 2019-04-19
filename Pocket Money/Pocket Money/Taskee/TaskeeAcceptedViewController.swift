//
//  TaskeeAcceptedViewController.swift
//  Pocket Money
//

//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeAcceptedViewController: UIViewController {

    var userdata : NSDictionary?
    var txns = [String]()
    var ref : DatabaseReference!
    var taskData : NSDictionary?
    var spvalue : NSDictionary?
    var selectedData : String?
    var delegate : SwitchingTabsDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var appliedtoaccepted: UISegmentedControl!
    
    @IBAction func AppliedAccepted(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        delegate?.onSwitchBack()
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        ref = Database.database().reference()
        getData()
        getDataFromFirebase()
        appliedtoaccepted.selectedSegmentIndex = 1
    }
    
    func getData() {
        let taskNames = userdata?["accepted"] as? NSDictionary
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
        if (segue.identifier == "Accepted to Applied") {
            let vc = segue.destination as! TaskeeAppliedViewController
            vc.userdata = userdata
        }
        if (segue.identifier == "Accepted to Task Info") {
            let vc = segue.destination as! TaskeeAcceptedTaskInfo
            vc.taskData = spvalue![selectedData] as! NSDictionary
        }
    }
}

extension TaskeeAcceptedViewController: UITableViewDataSource
{
    func numberOfSections(in tableView3: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return txns.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskeeAcceptedCell")!

        let app = txns[indexPath.row]
        cell.textLabel?.text = app
        
        return cell
    }
}

extension TaskeeAcceptedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData = txns[indexPath.row]
        performSegue(withIdentifier: "Accepted to Task Info", sender: self)
    }
}

