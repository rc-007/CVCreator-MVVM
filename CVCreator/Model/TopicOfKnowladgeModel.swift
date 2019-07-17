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
   
    func getParameterDict() -> [String:String] {
        return[
            "knowledge1": knowledge1,
            "experience1":experience1,
            
            "knowledge2": knowledge2,
            "experience2":experience2,
           
            "knowledge3": knowledge3,
            "experience3":experience3,
            
            "knowledge4": knowledge4,
            "experience4":experience4,
            
            "knowledge5": knowledge5,
            "experience5":experience5
        ]
    }
    
    
    func saveParameterDict(dict : [String: Any]) -> TopicOfKnowladgeModel {
        var model = TopicOfKnowladgeModel()
        model.knowledge1 = dict["knowledge1"] as! String
        model.experience1 = dict["experience1"]  as! String
        model.knowledge2 = dict["knowledge2"] as! String
        model.experience2 = dict["experience2"]  as! String
        model.knowledge3 = dict["knowledge3"] as! String
        model.experience3 = dict["experience3"]  as! String
        model.knowledge4 = dict["knowledge4"] as! String
        model.experience4 = dict["experience4"]  as! String
        model.knowledge5 = dict["knowledge5"] as! String
        model.experience5 = dict["experience5"]  as! String
        return model
    }
    
    
}
