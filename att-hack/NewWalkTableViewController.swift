//
//  NewWalkTableViewController.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit
import MapKit

class NewWalkTableViewController: UITableViewController {
    
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func donePressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var familySelectedLabel: UILabel!
    
    var selectedCoord: CLLocationCoordinate2D?
    var selectedZoom: Double?
    
    var selectedUserIndexs = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SelectLocationSegue" {
            let vc = segue.destinationViewController as! SelectLocationViewController
            vc.delegate = self
            vc.startLocation = self.selectedCoord
            vc.startZoom = self.selectedZoom
        }
        
        else if segue.identifier == "SelectUsersSegue" {
            let vc = segue.destinationViewController as! SelectUserTableViewController
            vc.delegate = self
            vc.selectedIndexs = selectedUserIndexs
        }
    }

}

extension NewWalkTableViewController: SelectLocationDelegate {
    func locationSelected(coord: CLLocationCoordinate2D, zoom: Double) {
        self.selectedCoord = coord
        self.selectedZoom = zoom
        
        locationLabel.text = "(\(String(format: "%.4f", coord.latitude)), \(String(format: "%.4f", coord.longitude)))"
    }
}

extension NewWalkTableViewController: SelectUsersDelegate {
    func usersChanged(indexes: [Int]) {
        self.selectedUserIndexs = indexes
        familySelectedLabel.text = "\(indexes.count) Selected"
    }
}
