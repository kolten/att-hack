//
//  SelectUserTableViewController.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit

protocol SelectUsersDelegate {
    func usersChanged(indexes: [Int])
}

class SelectUserTableViewController: UITableViewController {
    
    let users = House.sharedInstance.users
    var selectedIndexs = [Int]()
    var delegate: SelectUsersDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SelectUserTableViewCell

        let user = users[indexPath.row]
        cell.userName.text = user.name
        
        if selectedIndexs.contains(indexPath.row) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.tableView.cellForRowAtIndexPath(indexPath)!
        
        if let i = selectedIndexs.indexOf(indexPath.row) {
            selectedIndexs.removeAtIndex(i)
            cell.accessoryType = .None
        } else {
            selectedIndexs.append(indexPath.row)
            cell.accessoryType = .Checkmark
        }
        
        // Send to delegate
        delegate?.usersChanged(selectedIndexs)
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
