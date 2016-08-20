//
//  WalksTableViewController.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit

class WalksTableViewController: UITableViewController {
    
    var todaysWalks = [Walk]()
    var pastWalks = [Walk]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Walks"
        
        // Fake than sweet and low
        let u = User(name: "Sara", phone: "")
        
        todaysWalks.append(Walk(user: u, locationLabel: "School", status: .EnRoute))
        todaysWalks.append(Walk(user: u, locationLabel: "Amy's house", status: .Arrived))
        
        pastWalks.append(Walk(user: u, locationLabel: "School", status: .Late))
    }
    
    func addWalk(sender: UIBarButtonItem?) {
        print("Walk wit it")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return todaysWalks.count
        }
        
        return pastWalks.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.mainDark()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! WalkTableViewCell
        
        var walk: Walk
        
        if indexPath.section == 0 {
            walk = todaysWalks[indexPath.row]
        } else {
            walk = pastWalks[indexPath.row]
        }
        
        cell.userName.text = walk.user.name
        cell.status.text = walk.getStatusString()
        cell.status.textColor = walk.getStatusColor()
        cell.labelView.backgroundColor = walk.getStatusColor()
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Today"
        }
        
        return "Past"
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue == "viewLocationSegue" {
            let vc = segue.destinationViewController as! MapViewController
            
            if let index = self.tableView.indexPathForSelectedRow {
                if index.section == 0 {
                    vc.walk = todaysWalks[index.row]
                } else {
                    vc.walk = pastWalks[index.row]
                }
            }
        }
    }
    
    
}
