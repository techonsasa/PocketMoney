//
//  TaskerHomeViewController.swift
//  Pocket Money
//
//  Created by Sathiyan Kutty on 2/19/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit
import Firebase

class TaskerHomeViewController: UIViewController {

    @IBOutlet weak var tableView4: UITableView!
    var user : String?
  
//    var ref: DatabaseReference!

    var txns = [(task:"Petsitting - Denny Garney", taskdate:"4/15/2019"),
                (task:"Coding - Verla Veasley", taskdate:"4/21/2019"),
                (task: "Tuition - Jaymie Ruck", taskdate:"4/22/2019"),
                (task: "Lawnmowing - Porsha Alfrey", taskdate:"4/23/2019"),
                ]
    
    //ref?.child("taskerhome").updateChildValues(data)
    
    

    
    //reference for database
    
    var data = [NSDictionary]()
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         tableView4.dataSource = self
   }

    func getDataFromFirebase () {
        ref.child("tasks").observeSingleEvent(of: .value, with: { (snapshot) in
            let spvalue = snapshot.value as? NSDictionary
            for (key, value) in spvalue! {
                print ("Value : \(value) for key: \(key)")
                self.data.append(value as! NSDictionary)
            }
            
            print(self.data)
            self.tableView4.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "go to add event") {
            let vc = segue.destination as! AddEventViewController
            vc.user = user
        }
    }
}

extension TaskerHomeViewController: UITableViewDataSource
{
    
    func numberOfSections(in tableView4: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return tasks.count
        //  return apps.count
        return txns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskerHomeTableCell")!
        
        let app = txns[indexPath.row]
        cell.textLabel?.text=app.task
        cell.detailTextLabel?.text=app.taskdate
        
        //When Database Link works then uncomment following:
        //cell.textLabel?.text = data[indexPath.row]["task"] as! String
        //cell.detailTextLabel?.text = data[indexPath.row]["taskdate"] as! String
        
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
