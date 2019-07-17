//
//  TopicOfKnowladgeViewModel.swift
//  CVCreator
//
//  Created by MACBOOK PRO on 09/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

struct TopicOfKnowladgeViewModel {
   
    private(set) var experience1:String = ""
    private(set) var experience2:String = ""
    private(set) var experience3:String = ""
    private(set) var experience4:String = ""
    private(set) var experience5:String = ""
    
    private(set) var knowledge1:String = ""
    private(set) var knowledge2:String = ""
    private(set) var knowledge3:String = ""
    private(set) var knowledge4:String = ""
    private(set) var knowledge5:String = ""
    
    let topicModel : TopicOfKnowladgeModel
    
    init(topicModel: TopicOfKnowladgeModel) {
        self.topicModel = topicModel
        self.updateProperties()
    }
    
    private mutating func updateProperties() {
        
        experience1 = topicModel.experience1
        experience2 = topicModel.experience2
        experience3 = topicModel.experience3
        experience4 = topicModel.experience4
        experience5 = topicModel.experience5
        
        knowledge1 = topicModel.knowledge1
        knowledge2 = topicModel.knowledge2
        knowledge3 = topicModel.knowledge3
        knowledge4 = topicModel.knowledge4
        knowledge5 = topicModel.knowledge5
    }
    
    func getExperience1() -> String {
        return !kAppSettingManager.topicModel.experience1.isEmpty ? kAppSettingManager.topicModel.experience1 : experience1
    }
    
    func getExperience2() -> String {
        return !kAppSettingManager.topicModel.experience2.isEmpty ? kAppSettingManager.topicModel.experience2 : experience2
    }
    
    func getExperience3() -> String {
        return !kAppSettingManager.topicModel.experience3.isEmpty ? kAppSettingManager.topicModel.experience3 : experience3
    }
    
    func getExperienc4() -> String {
        return !kAppSettingManager.topicModel.experience4.isEmpty ? kAppSettingManager.topicModel.experience4 : experience4
    }
    
    func getExperience5() -> String {
        return !kAppSettingManager.topicModel.experience5.isEmpty ? kAppSettingManager.topicModel.experience5 : experience5
    }
    
    
    func getKnowladge1() -> String {
        return !kAppSettingManager.topicModel.knowledge1.isEmpty ? kAppSettingManager.topicModel.knowledge1 : knowledge1
    }
    
    func getKnowladge2() -> String {
        return !kAppSettingManager.topicModel.knowledge2.isEmpty ? kAppSettingManager.topicModel.knowledge2 : knowledge2
    }
    
    func getKnowladge3() -> String {
        return !kAppSettingManager.topicModel.knowledge3.isEmpty ? kAppSettingManager.topicModel.knowledge3 : knowledge3
    }
    
    func getKnowladge4() -> String {
        return !kAppSettingManager.topicModel.knowledge4.isEmpty ? kAppSettingManager.topicModel.knowledge4 : knowledge4
    }
    
    func getKnowladge5() -> String {
        return !kAppSettingManager.topicModel.knowledge5.isEmpty ? kAppSettingManager.topicModel.knowledge5 : knowledge5
    }
}
