//
//  AdditionalInformationModel.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 10/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

struct AdditionalInformationModel: Codable {
    var detail: String = ""
  
    enum CodingKeys:String,CodingKey {
        case detail
    }
    
    mutating func setValueWithTextField(key:AdditionalInformationModel.CodingKeys,value:String)
    {
        switch key
        {
        case .detail:
            self.detail = value
        }
    }
}
