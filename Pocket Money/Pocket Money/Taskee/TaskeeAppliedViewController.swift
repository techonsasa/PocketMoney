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
    
    @IBOutlet weak var tableView: UITableView!
    var txns = [String]()
    
//    var txns = [(task: "Gift Wrapping", taskdate:"2/1/2019"),
//                (task: "Petsitting", taskdate:"2/2/2019"),
//                (task: "Coding", taskdate:"2/4/2019"),
//                (task: "PC Support", taskdate:"2/7/2019"),
//                (task: "Flower Arrangement", taskdate:"2/10/2019"),
//                ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
        print(userdata)
    }
    
    func getData() {
        let taskNames = userdata?["applied"] as? NSDictionary
        if let tasknames = taskNames {
            for (_, value) in tasknames {
                txns.append(value as! String)
            }
        }
    }

}

extension TaskeeAppliedViewController: UITableViewDelegate {
    
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
