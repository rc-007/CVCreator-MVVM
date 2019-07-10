//
//  DashboardViewModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class DashboardViewModel: NSObject {
    
    var optionArray: [OptionData] = []
    
    func loadOption() {
        
        optionArray = [OptionData(title: CreatCVTitle.personalInfo, color:UIColor.ColorPattern2()), OptionData(title: CreatCVTitle.education, color:UIColor.ColorPattern3()), OptionData(title: CreatCVTitle.TopicsOfKnowladge, color: UIColor.ColorPattern4()), OptionData(title: CreatCVTitle.pastProject, color: UIColor.ColorPattern2()), OptionData(title: CreatCVTitle.currentDetails, color: UIColor.ColorPattern3()), OptionData(title: CreatCVTitle.additionalInfo, color: UIColor.ColorPattern4())]
    }
    
}
