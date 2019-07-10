//
//  CompanyDetailViewModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 10/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import Foundation
import UIKit

struct CompanyDetailViewModel {
    
    private(set) var companyName:String = ""
    private(set) var designation:String = ""
    private(set) var experience:String = ""
    private(set) var achievements:String = ""
  
    let companyModel : CompanyModel
    init(companyModel: CompanyModel) {
        self.companyModel = companyModel
        self.updateProperties()
    }
    
    private mutating func updateProperties() {
        companyName = companyModel.companyName
        designation = companyModel.designation
        experience = companyModel.experience
        achievements = companyModel.achievements
    }
}
