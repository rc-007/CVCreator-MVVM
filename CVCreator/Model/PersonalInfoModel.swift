//
//  PersonalInfoModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 08/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

struct PersonalInfoModel: Codable {
    
    var firstName:String = ""
    var lastName:String = ""
    var phoneNumber:String = ""
    var emailId:String = ""
    var address1:String = ""
    var address2:String = ""
    var dob:String = ""
    
    enum CodingKeys:String,CodingKey {
        case emailId
        case firstName
        case lastName
        case phoneNumber
        case address1
        case address2
        case dob
    }
    
    mutating func setValueWithTextField(key:PersonalInfoModel.CodingKeys,value:String)
    {
        switch key
        {
        case .firstName:
            self.firstName = value
        case .lastName:
            self.lastName = value
        case .phoneNumber:
            self.phoneNumber = value
        case .emailId:
            self.emailId = value
        case .address1:
            self.address1 = value
        case .address2:
            self.address2 = value
        case .dob:
            self.dob = value
            
        }
    }
    
    mutating func setModelData(data :PersonalInfoModel)
    {
        self.firstName = data.firstName
        self.lastName = data.lastName
        self.phoneNumber = data.phoneNumber
        self.emailId = data.emailId
        self.address2 = data.address2
        self.address1 = data.address1
        self.dob = data.dob
    }
    
    func getParameterDict() -> [String:String] {
        return["firstName": firstName,
               "lastName":lastName,
               "phoneNumber":phoneNumber,
               "emailId":emailId,
               "address1":address1,
               "address2":address2,
               "dob":dob
        ]
    }
    
    func saveParameterDict(dict : [String: Any]) -> PersonalInfoModel {
        var model = PersonalInfoModel()
        model.firstName = dict["firstName"] as! String
        model.lastName = dict["lastName"]  as! String
        model.phoneNumber = dict["phoneNumber"] as! String
        model.emailId = dict["emailId"] as! String
        model.address1 = dict["address1"] as! String
        model.address2 = dict["address2"] as! String
        model.dob = dict["dob"] as! String
        return model
    }
    
    
}
