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
}
