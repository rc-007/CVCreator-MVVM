//
//  TopicOfKnowladgeModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 09/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import Foundation


struct TopicOfKnowladgeModel : Codable {
    
    var knowledge1: String = ""
    var knowledge2:String = ""
    var knowledge3: String = ""
    var knowledge4: String = ""
    var knowledge5: String = ""
    
    var experience1:String = ""
    var experience2: String = ""
    var experience3: String = ""
    var experience4: String = ""
    var experience5: String = ""

    
    enum CodingKeys:String,CodingKey {
        case experience1
        case experience2
        case experience3
        case experience4
        case experience5
        case knowledge1
        case knowledge2
        case knowledge3
        case knowledge4
        case knowledge5
    }
    
    mutating func setValueWithTextField(key: TopicOfKnowladgeModel.CodingKeys, value:String) {
        switch key {
        case .experience1:
            self.experience1 = value
        case .experience2:
            self.experience2 = value
        case .experience3:
            self.experience3 = value
        case .experience4:
            self.experience4 = value
        case .experience5:
            self.experience5 = value
        case .knowledge1:
            self.knowledge1 = value
        case .knowledge2:
            self.knowledge2 = value
        case .knowledge3:
            self.knowledge3 = value
        case .knowledge4:
            self.knowledge4 = value
        case .knowledge5:
            self.knowledge5 = value
        
        }
    }
}
