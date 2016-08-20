//
//  UIColorRandomExtension.swift
//  att-hack
//
//  Created by Kolten Sturgill on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
