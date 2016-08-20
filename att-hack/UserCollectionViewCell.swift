//
//  UserCollectionViewCell.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    func animate(delay: NSTimeInterval) {
        let OG = userImage.frame.size
        
        userImage.frame = CGRectMake(OG.width / 2, OG.height / 2, 0, 0)
        
        UIView.animateWithDuration(0.25, delay: delay, usingSpringWithDamping: 0.4, initialSpringVelocity: 3, options: .CurveEaseIn, animations: {
            self.userImage.frame = CGRectMake(0, 0, OG.width, OG.height)
        }, completion: nil)
    }
}
