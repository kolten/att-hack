//
//  User.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

class User {
    
    var name: String
    var phone: String
    var imageUrl: String?
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}