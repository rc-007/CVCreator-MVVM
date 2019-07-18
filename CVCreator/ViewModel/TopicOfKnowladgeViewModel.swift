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

}
