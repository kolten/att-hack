//
//  WalksTableViewController.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit
import MapKit

class WalksTableViewController: UITableViewController {
    
    var house = House.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return house.walks.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! WalkTableViewCell
        
        let walk = house.walks[indexPath.row]
        
        cell.userName.text = walk.user.name
        cell.status.text = walk.getStatusString()
        cell.status.textColor = walk.getStatusColor()
        cell.labelView.backgroundColor = walk.getStatusColor()
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "viewLocationSegue" {
            let vc = segue.destinationViewController as! MapViewController
            
            if let index = self.tableView.indexPathForSelectedRow {
                vc.walk = house.walks[index.row]
            }
        }
    }
    
    
}
