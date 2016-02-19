//
//  UIColor+Addition.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/14.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import Foundation
import UIKit

func RGB(red:Int16, _ green: Int16, _ blue : Int16, alpha: CGFloat = 1.0) -> UIColor {
    
    let color = UIColor.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha);
    return color
}

extension UIColor {
    
    enum ColorName: UInt32 {
        
        case Translucent = 0xffffffcc
        
        var color: UIColor {
            return UIColor(named: self)
        }
    }
    
    convenience init(named name: ColorName) {
        
        let rgbaValue = name.rawValue
        let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
        let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
        let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
        let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
}