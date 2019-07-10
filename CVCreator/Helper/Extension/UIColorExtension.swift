//
//  UIColorExtension.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

extension UIColor {
   
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
    
   public class func AppTextFieldBlackColor() -> UIColor {
        // 2C3836
        return UIColor(red:0.17, green:0.22, blue:0.21, alpha:1.0)
    }
    
    public class func AppBorderGrayColor() -> UIColor {
        return UIColor(red:0.87, green:0.87, blue:0.87, alpha:1.0)
    }
    
    public class func ColorPattern1() -> UIColor {
        return UIColor(red:0.18, green:0.32, blue:0.46, alpha:1.0)
    }
    
    public class func ColorPattern2() -> UIColor {
        return UIColor(red:0.27, green:0.58, blue:0.63, alpha:1.0)
    }
    
    public class func ColorPattern3() -> UIColor {
        return UIColor(red:0.73, green:0.93, blue:0.95, alpha:1.0)
    }
    
    public class func ColorPattern4() -> UIColor {
        return UIColor(red:0.96, green:1.00, blue:0.90, alpha:1.0)
    }
    public class func ColorPattern5() -> UIColor {
        return UIColor(red:0.86, green:0.52, blue:0.19, alpha:1.0)
    }
}
