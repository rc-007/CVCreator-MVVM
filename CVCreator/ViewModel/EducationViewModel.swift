//
//  EducationViewModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 09/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

struct EducationViewModel {
    
    var toSelectedDate = Date()
    var fromSelectedDate = Date()
    private(set) var universityName:String = ""
    private(set) var courseName:String = ""
    private(set) var fromDate:String = ""
    private(set) var toDate:String = ""
    
    let educationModel : EducationModel
    
    init(educationModel: EducationModel) {
        self.educationModel = educationModel
        self.updateProperties()
    }
    
    private mutating func updateProperties() {
        universityName = educationModel.universityName
        courseName = educationModel.courseName
        fromDate = educationModel.fromDate
        toDate = educationModel.toDate
    }
    
    mutating func setToSelectedDate(date: Date) {
        self.toSelectedDate = date
    }
    
    mutating func setFromSelectedDate(date: Date) {
        self.fromSelectedDate = date
    }
}
