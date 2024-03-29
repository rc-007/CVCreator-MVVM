//
//  CompanyModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 10/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

struct CompanyModel: Codable {
    
    var companyName: String = ""
    var designation: String = ""
    var experience: String = ""
    var achievements: String = ""
    
    enum CodingKeys:String,CodingKey {
        case achievements, companyName, designation, experience
    }
    
    mutating func setValueWithTextField(key:CompanyModel.CodingKeys,value:String)
    {
        switch key
        {
        case .companyName:
            self.companyName = value
        case .designation:
            self.designation = value
        case .experience:
            self.experience = value
        case .achievements:
            self.achievements = value
        }
    }
    
    
    func getParameterDict() -> [String:String] {
        return[
            "companyName": companyName,
            "designation":designation,
            "experience": experience,
            "achievements":achievements
        ]
    }
    
    func saveParameterDict(dict : [String: Any]) -> CompanyModel {
        var model = CompanyModel()
        model.companyName = dict["companyName"] as! String
        model.designation = dict["designation"]  as! String
        model.experience = dict["experience"] as! String
        model.achievements = dict["achievements"]  as! String
      
        return model
    }
    
}
