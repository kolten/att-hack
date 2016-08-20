//
//  TabViewController.swift
//  att-hack
//
//  Created by Kolten Sturgill on 8/19/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navbar = navigationController?.navigationBar {
            navbar.shadowImage = UIImage()
            navbar.setBackgroundImage(navbar.shadowImage, forBarMetrics: .Default)
            navbar.topItem?.title = "Walks App"
        }
    }

}
