//
//  TaskeeHomeScreenVC.swift
//  Pocket Money
//
//  Created by Sharra Kutty on 1/25/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import Foundation
import UIKit

class TaskeeHomeScreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var names = ["lorman", "sharra", "bill", "bob"]
    
    @IBOutlet weak var jobPostingTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jobCell = tableView.dequeueReusableCell(withIdentifier: "jobPostingCell", for: indexPath) as! JobPostingCell
        jobCell.nameInputText.text = names[indexPath.row]
        return jobCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(names[indexPath.row])
    }
    
    @IBOutlet weak var btnMessage: UIButton!
    

//    let job = {}
    
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        jobPostingTableView.delegate = self
        jobPostingTableView.dataSource = self
        self.applyRoundCorners(btnMessage)
        
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func applyRoundCorners(_ object:AnyObject )  {
        
        object.layer.cornerRadius = object.frame.size.width / 2
        object.layer.masksToBounds = true
    }
    
    
}
