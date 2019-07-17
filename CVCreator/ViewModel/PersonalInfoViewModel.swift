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
    
    func getFirstName() -> String {
        return !kAppSettingManager.personalInfoModel.firstName.isEmpty ? kAppSettingManager.personalInfoModel.firstName : firstName
    }
    
    func getLastName() -> String {
        return !kAppSettingManager.personalInfoModel.lastName.isEmpty ? kAppSettingManager.personalInfoModel.lastName : lastName
    }
    
    func getPhoneNumber() -> String {
        return !kAppSettingManager.personalInfoModel.phoneNumber.isEmpty ? kAppSettingManager.personalInfoModel.phoneNumber : phoneNumber
    }
    
    func getEmail() -> String {
        return !kAppSettingManager.personalInfoModel.emailId.isEmpty ? kAppSettingManager.personalInfoModel.emailId : emailId
    }
    
    func getAddress1() -> String {
        return !kAppSettingManager.personalInfoModel.address1.isEmpty ? kAppSettingManager.personalInfoModel.address1 : address1
    }
    
    func getAddress2() -> String {
        return !kAppSettingManager.personalInfoModel.address2.isEmpty ? kAppSettingManager.personalInfoModel.address2 : address2
    }
    
    func getDOB() -> String {
        return !kAppSettingManager.personalInfoModel.dob.isEmpty ? kAppSettingManager.personalInfoModel.dob : dob
    }
    
}
