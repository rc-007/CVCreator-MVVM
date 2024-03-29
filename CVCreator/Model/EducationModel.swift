//
//  EducationModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 08/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

struct EducationModel : Codable {
    
    var universityName: String = ""
    var courseName:String = ""
    var fromDate: String = ""
    var toDate: String = ""
    
    enum CodingKeys:String,CodingKey {
        case universityName
        case courseName
        case fromDate
        case toDate
    }
    
    mutating func setValueWithTextField(key: EducationModel.CodingKeys, value:String) {
        switch key {
        case .universityName:
            self.universityName = value
        case .courseName:
            self.courseName = value
        case .fromDate:
            self.fromDate = value
        case .toDate:
            self.toDate = value
        }
    }
    
    func getParameterDict() -> [String:String] {
        return[
            "universityName": universityName,
            "courseName":courseName,
            "fromDate":fromDate,
            "toDate":toDate
        ]
    }
    
    
    func saveParameterDict(dict : [String: Any]) -> EducationModel {
        var model = EducationModel()
        model.universityName = dict["universityName"] as! String
        model.courseName = dict["courseName"]  as! String
        model.fromDate = dict["fromDate"] as! String
        model.toDate = dict["toDate"]  as! String
        
        return model
    }
}
