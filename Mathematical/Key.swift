//
//  Key.swift
//  Mathematical
//
//  Created by Aaron C-T on 6/24/17.
//  Copyright © 2017 Aaron C-T. All rights reserved.
//

import Foundation
import UIKit

class Key: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let highlightColor = UIColor.init(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0)
        self.layer.cornerRadius = 0.15 * self.bounds.size.width
        self.clipsToBounds = true
        self.setBackgroundImage(Key.imageFromColor(color: highlightColor), for: .highlighted)
    }

    // Draws calculator key button backgrounds
    class func convertToCGColor(color: UIColor) -> CGColor {
        let newColor = color.cgColor
        return newColor
    }
    
    class func imageFromColor(color: UIColor) -> UIImage {
        let fillColor = convertToCGColor(color: color)
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(fillColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
}
























