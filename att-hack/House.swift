//
//  House.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

class House {
    
    static let sharedInstance = House()
    
    var users = [User]()
    var walks = [Walk]()
    
    init() {
    }
}
