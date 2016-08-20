//
//  RandomExtension.swift
//  att-hack
//
//  Created by Kolten Sturgill on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}