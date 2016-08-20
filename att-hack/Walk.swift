//
//  Walk.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit

public enum WalkStatus {
    case Scheduled, EnRoute, Arrived, Late
}

class Walk {
    
    var user: User
    var locationLabel: String
    var status: WalkStatus
    
    init(user: User, locationLabel: String, status: WalkStatus) {
        self.user = user
        self.locationLabel = locationLabel
        self.status = status
    }
    
    func getStatusColor() -> UIColor {
        switch status {
        case .Scheduled:
            return UIColor.mainDark()
        case .EnRoute:
            return UIColor.statusYellow()
        case .Arrived:
            return UIColor.statusGreen()
        case .Late:
            return UIColor.statusRed()
        }
    }
    
    func getStatusString() -> String {
        switch status {
        case .Scheduled:
            return "Scheduled"
        case .EnRoute:
            return "En Route"
        case .Arrived:
            return "Arrived"
        case .Late:
            return "Late"
        }
    }
    
}
