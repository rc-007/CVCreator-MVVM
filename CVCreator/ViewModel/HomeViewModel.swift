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
    
    func loadingDataFromDocumentDirectory(){
        NetworkManager().loadingForCV(url: Utility().getDocumentsDirectory()) { (success, response) in
            if success {
                guard let dictionary = response as? [String: Any] else{return}
                kAppSettingManager.saveResumeData(dictionary: dictionary)
            } else {
                
            }
        }
    }
    
    func saveDataInDirectory() {
        NetworkManager().requestForWriteData(Utility().getDocumentsDirectory(), parameters: kAppSettingManager.getResumeDataFromDictionary()) { (succes, response) in
            if succes {
                print("saved")
            } else {
                print("error")
            }
        }
    }
}
