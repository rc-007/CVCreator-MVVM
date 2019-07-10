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
}
