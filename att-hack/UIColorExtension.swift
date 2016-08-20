//
//  UIColorExtension.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    // MARK: - My Colors
    static func mainBlue() -> UIColor {
        return UIColor(netHex: 0x648AFF)
    }
    
    static func mainLightBlue() -> UIColor {
        return UIColor(netHex: 0xD1D7E6)
    }
    
    static func mainDark() -> UIColor {
        return UIColor(netHex: 0x606060)
    }
    
    static func mainWhite() -> UIColor {
        return UIColor(netHex: 0xFEFEFE)
    }
    
    static func statusGreen() -> UIColor {
        return UIColor(netHex: 0xA6CA87)
    }
    
    static func statusYellow() -> UIColor {
        return UIColor(netHex: 0xF79E4B)
    }
    
    static func statusRed() -> UIColor {
        return UIColor(netHex: 0xEB7664)
    }
}
