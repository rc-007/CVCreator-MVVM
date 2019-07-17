//
//  ProjectModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 10/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import Foundation


struct ProjectModel: Codable {
    
    var project1: String = ""
    var project2: String = ""
    var technology1: String = ""
    var technology2: String = ""
    var duration1: String = ""
    var duration2: String = ""
    var description1: String = ""
    var description2: String = ""
    
    enum CodingKeys:String,CodingKey {
        case project1, project2, technology1, technology2, duration1, duration2, description1, description2
    }
    
    mutating func setValueWithTextField(key:ProjectModel.CodingKeys,value:String)
    {
        switch key
        {
        case .project1:
            self.project1 = value
        case .project2:
            self.project2 = value
        case .technology1:
            self.technology1 = value
        case .technology2:
            self.technology2 = value
        case .duration1:
            self.duration1 = value
        case .duration2:
            self.duration2 = value
        case .description1:
            self.description1 = value
        case .description2:
            self.description2 = value
        }
    }
    
    func getParameterDict() -> [String:String] {
        return["project1": project1,
               "project2":project2,
               "technology1":technology1,
               "technology2":technology2,
               "duration1":duration1,
               "duration2":duration2,
               "description1":description1,
               "description2":description2
        ]
    }
    
    
    func saveParameterDict(dict : [String: Any]) -> ProjectModel {
        var model = ProjectModel()
        model.project1 = dict["project1"] as! String
        model.project2 = dict["project2"]  as! String
        model.technology1 = dict["technology1"] as! String
        model.technology2 = dict["technology2"] as! String
        model.duration1 = dict["duration1"] as! String
        model.duration2 = dict["duration2"] as! String
        model.description1 = dict["description1"] as! String
        model.description2 = dict["description2"] as! String
        return model
    }
    
  
}
