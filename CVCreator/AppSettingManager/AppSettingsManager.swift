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
    
    //Converting to Dictionary

    func getResumeDataFromDictionary() -> [String:Any] {
        return["personalInfo":personalInfoModel.getParameterDict(),
               "education":educationModel.getParameterDict(),
               "technicalExpertise":topicModel.getParameterDict(),
               "projectExp":projectModel.getParameterDict(),
               "pastExp":companyModel.getParameterDict(),
               "additionalInfo":additionalInfoModel.getParameterDict()
        ]
    }
    
    func saveResumeData(dictionary:[String: Any]) {
        personalInfoModel = personalInfoModel.saveParameterDict(dict: dictionary["personalInfo"] as! [String : Any])
        educationModel = educationModel.saveParameterDict(dict: dictionary["education"] as! [String : Any])
        topicModel = topicModel.saveParameterDict(dict: dictionary["technicalExpertise"] as! [String : Any])
        projectModel = projectModel.saveParameterDict(dict: dictionary["projectExp"]as! [String : Any])
        companyModel = companyModel.saveParameterDict(dict: dictionary["pastExp"]as! [String : Any])
        additionalInfoModel = additionalInfoModel.saveParameterDict(dict: dictionary["additionalInfo"]as! [String : Any])
    }
}
