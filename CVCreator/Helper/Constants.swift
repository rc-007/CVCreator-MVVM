//
//  Constants.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

let kAppSettingManager = AppSettingsManager.sharedInstance

struct OptionData {
    var title: String
    var color: UIColor
}

struct  HomeOptionTitles {
    static let cvTamplate = "CV Tamplate"
    static let createOwnCV = "Create Own CV"
}

struct TextValues{
    static let features = "Features"
    static let createCV = "Create CV"
    static let home = "Home"
}

struct SegueIdentifier {
    static let dashboard = "segueDashboard"
    static let personal = "seguePersonal"
    static let education = "segueEducation"
    static let topic = "segueTopic"
    static let pastProject = "seguePastProject"
    static let currentCompanyDetails = "segueCurrentCompanyDetail"
    static let additionalInfo = "segueAdditionalDetails"
}

struct CreatCVTitle {
    static let personalInfo = "Personal Information"
    static let education = "Education"
    static let TopicsOfKnowladge = "Topics of Knowladge"
    static let pastProject = "Past Project"
    static let currentDetails = "Company Details"
    static let additionalInfo = "Additional Information"
}
