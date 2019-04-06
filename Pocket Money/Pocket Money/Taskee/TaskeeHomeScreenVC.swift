//
//  TaskeeHomeScreenVC.swift
//  Pocket Money
//
//  Created by Sharra Kutty on 1/25/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskeeHomeScreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedData : NSDictionary?
    var data = [NSDictionary]()
    var ref : DatabaseReference!
    var userdata : NSDictionary?
    
    @IBOutlet weak var jobPostingTableView: UITableView!
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jobCell = tableView.dequeueReusableCell(withIdentifier: "jobPostingCell", for: indexPath) as! TaskeeJobPostingCell
//        jobCell.nameInputText.text = names[indexPath.row][""]
        jobCell.nameOfTask?.text = data[indexPath.row]["jobName"] as? String
        jobCell.nameOfTasker?.text = data[indexPath.row]["taskerName"] as? String
        jobCell.dateOfTask?.text = data[indexPath.row]["jobDate"] as? String
        jobCell.timeOfTask?.text = data[indexPath.row]["jobTime"] as? String
        return jobCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData = data[indexPath.row]
        performSegue(withIdentifier: "Taskee to Task Segue", sender: self)
    }
    
    @IBOutlet weak var btnMessage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobPostingTableView.delegate = self
        jobPostingTableView.dataSource = self
        ref = Database.database().reference()
        getDataFromFirebase()
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getDataFromFirebase () {
        ref.child("tasks").observeSingleEvent(of: .value, with: { (snapshot) in
            let spvalue = snapshot.value as? NSDictionary
            for (key, value) in spvalue! {
                self.data.append(value as! NSDictionary)
            }
            self.jobPostingTableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Taskee to Task Segue") {
            let vc = segue.destination as! TaskerInformation
            vc.data = selectedData
            vc.userdata = userdata
        }
    }
}
