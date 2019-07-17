//
//  Constants.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

let kAppSettingManager = AppSettingsManager.sharedInstance
typealias CompletionHandler = (_ success: Bool, _ response: Any?) -> Void
typealias ProgressBlock = ((Progress) -> Void)

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

struct Constants {
    
    // MARK: General Constants
    static let EmptyString = ""
    static let UserDefaultsDeviceTokenKey = "DeviceTokenKey"
    
    // MARK: Enums
    enum RequestType: NSInteger {
        case GET
        case POST
        case MultiPartPost
        case DELETE
        case PUT
    }
    
    // MARK: Numerical Constants
    static let StatusSuccess = 1
    static let ResponseStatusSuccess = 200
    static let ResponseStatusCreated = 201
    static let ResponseStatusAccepted = 202
    static let ResponseStatusNoResponse = 204
    static let ResponseStatusForbidden = 401
    static let ResponseStatusAleradyExist = 409
    static let ResponseStatusEmailNotFound = 422
    static let ResponseStatusServerError = 500
    static let ResponseInvalidCredential = 401
    static let ResponseStatusUserNotExist = 404
    
    // MARK: Network Keys
    static let InsecureProtocol = "http://"
    static let SecureProtocol = "https://"
    static let LocalEnviroment = "LOCAL"
    static let StagingEnviroment = "STAGING"
    static let LiveEnviroment = "LIVE"
    
    
    static let kMessageInternalServer = "Internal Server Error"
    static let kMessageInvalidCredential = "Invalid Credential"
}
