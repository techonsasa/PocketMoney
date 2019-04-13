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
    
    @IBOutlet weak var tableView: UITableView!
    
//    var txns = [(task: "PC Support", taskdate:"1/1/2019"),
//                (task: "Petsitting", taskdate:"1/12/2019"),
//                (task: "Gift Wrapping", taskdate:"1/14/2019"),
//                (task: "Flower Arrangement", taskdate:"1/26/2019"),
//                (task: "Coding", taskdate:"1/30/2019"),
//                ]

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        getData()
    }
    
    func getData() {
        let taskNames = userdata?["accepted"] as? NSDictionary
        if let tasknames = taskNames {
            for (_, value) in tasknames {
                txns.append(value as! String)
            }
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
    
}
