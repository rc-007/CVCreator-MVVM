//
//  HomeViewModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit


class HomeViewModel: NSObject {

    var optionArray: [OptionData] = []
    
    func loadOption() {
        
        optionArray = [OptionData(title: HomeOptionTitles.cvTamplate, color: UIColor.ColorPattern2()), OptionData(title: HomeOptionTitles.createOwnCV, color: UIColor.ColorPattern3())]
    }
   
}
