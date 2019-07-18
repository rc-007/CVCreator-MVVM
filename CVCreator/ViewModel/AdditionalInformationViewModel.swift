//
//  AdditionalInformationViewModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 10/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import Foundation
import UIKit

struct AdditionalInformationViewModel {
    
    private(set) var detail:String = ""
    
    let infoModel : AdditionalInformationModel
    
    init(infoModel: AdditionalInformationModel) {
        self.infoModel = infoModel
        self.updateProperties()
    }
    
    private mutating func updateProperties() {
        detail = infoModel.detail
    }

}
