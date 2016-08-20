//
//  User.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import MapKit

class User {
    
    // MARK: Properties
    var name: String
    var phone: String
    var imageUrl: String?
    var location: CLLocationCoordinate2D?
    var destination: CLLocationCoordinate2D?
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }

}