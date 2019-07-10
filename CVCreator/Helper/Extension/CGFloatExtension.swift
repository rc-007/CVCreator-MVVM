//
//  CGFloatExtension.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit


extension CGFloat {
   
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
