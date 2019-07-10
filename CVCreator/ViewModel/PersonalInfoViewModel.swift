//
//  PersonalInfoViewModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 08/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

struct PersonalInfoViewModel {

    var selectedDate = Date()
    private(set) var firstName:String = ""
    private(set) var lastName:String = ""
    private(set) var phoneNumber:String = ""
    private(set) var emailId:String = ""
    private(set) var address1:String = ""
    private(set) var address2:String = ""
    private(set) var dob:String = ""
    
    let personalInfoModel : PersonalInfoModel
    
    init(personalInfo: PersonalInfoModel) {
        self.personalInfoModel = personalInfo
        self.updateProperties()
    }
    
    private mutating func updateProperties() {
        
        firstName = personalInfoModel.firstName
        lastName = personalInfoModel.lastName
        emailId = personalInfoModel.emailId
        phoneNumber = personalInfoModel.phoneNumber
        address1 = personalInfoModel.address1
        address2 = personalInfoModel.address2
        dob = personalInfoModel.dob
    }
    
    mutating func setSelectedDate(date: Date) {
        self.selectedDate = date
    }
    
}
