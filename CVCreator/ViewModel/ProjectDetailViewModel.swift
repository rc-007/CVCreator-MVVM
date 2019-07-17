//
//  ProjectDetailViewModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 10/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import Foundation


import UIKit

struct ProjectDetailViewModel {
    
    private(set) var project1:String = ""
    private(set) var project2:String = ""
    private(set) var technology1:String = ""
    private(set) var technology2:String = ""
    private(set) var duration1:String = ""
    private(set) var duration2:String = ""
    private(set) var description1:String = ""
    private(set) var description2:String = ""
    
    
    let projectModel : ProjectModel
    
    init(projectModel: ProjectModel) {
        self.projectModel = projectModel
        self.updateProperties()
    }
    
    private mutating func updateProperties() {
        project1 = projectModel.project1
        project2 = projectModel.project2
        technology1 = projectModel.technology1
        technology2 = projectModel.technology2
        duration1 = projectModel.duration1
        duration2 = projectModel.duration2
        description1 = projectModel.description1
        description2 = projectModel.description2
        
    }
    
    func getProject1Text() -> String {
        return !kAppSettingManager.projectModel.project1.isEmpty ? kAppSettingManager.projectModel.project1 : project1
    }
    
    func getProject2Text() -> String {
        return !kAppSettingManager.projectModel.project2.isEmpty ? kAppSettingManager.projectModel.project2 : project2
    }
    
    func getTechnology1Text() -> String {
        return !kAppSettingManager.projectModel.technology1.isEmpty ? kAppSettingManager.projectModel.technology1 : technology1
    }
    
    func getTechnology2Text() -> String {
        return !kAppSettingManager.projectModel.technology2.isEmpty ? kAppSettingManager.projectModel.technology2 : technology2
    }
    
    func getDuration1Text() -> String {
        return !kAppSettingManager.projectModel.duration1.isEmpty ? kAppSettingManager.projectModel.duration1 : duration1
    }
    
    func getDuration2Text() -> String {
        return !kAppSettingManager.projectModel.duration2.isEmpty ? kAppSettingManager.projectModel.duration2 : duration2
    }
    
    func getDescription1Text() -> String {
        return !kAppSettingManager.projectModel.description1.isEmpty ? kAppSettingManager.projectModel.description1 : description1
    }
    
    func getDescription2Text() -> String {
        return !kAppSettingManager.projectModel.description2.isEmpty ? kAppSettingManager.projectModel.description2 : description2
    }

    
}

