//
//  AppSettingsManager.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 08/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class AppSettingsManager: NSObject {

    static let sharedInstance = AppSettingsManager()
    
    var personalInfoModel: PersonalInfoModel = PersonalInfoModel()
    var educationModel: EducationModel = EducationModel()
    var topicModel: TopicOfKnowladgeModel = TopicOfKnowladgeModel()
    var projectModel: ProjectModel = ProjectModel()
    var companyModel: CompanyModel = CompanyModel()
    var additionalInfoModel: AdditionalInformationModel = AdditionalInformationModel()
}
