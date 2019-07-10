//
//  UIFontExtension.swift
//  CVCreater
//
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//


import Foundation
import UIKit

public extension UIFont {
    
    class func appBoldFontWithSize(size:CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: CGFloat(size))!
    }
    
    class func appMediumFontWithSize(size:Float) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: CGFloat(size))!
    }
    
    class func appRegularFontWithSize(size:Float) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: CGFloat(size))!
    }
  
}
