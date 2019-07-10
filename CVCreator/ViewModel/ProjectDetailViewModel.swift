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
}

