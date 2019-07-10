//
//  ViewController.swift
//  CVCreater
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK:- User Defined
    
    func pushViewController(storyboardName: String, with identifier: String, animate: Bool = true) {
        let viewController =  getViewController(storyboardName: storyboardName, identifier: identifier)
        self.navigationController?.pushViewController(viewController, animated: animate)
    }
    
    func getViewController(storyboardName: String, identifier: String) -> UIViewController{
        return UIStoryboard.init(name: storyboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: identifier)
    }

    func setNavigationBackButton() {
        let backButton = UIButton(type: .system)
        backButton.setImage( UIImage.init(named: "back"), for: .normal)
        
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let backBarButton = UIBarButtonItem(customView: backButton)
        navigationItem.setLeftBarButton(backBarButton, animated: false)
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setNavigationRightButton() {
        let rightButton = UIButton(type: .system)
        rightButton.setImage( UIImage.init(named: "save"), for: .normal)
        
        rightButton.tintColor = UIColor.white
        rightButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        let backBarButton = UIBarButtonItem(customView: rightButton)
        navigationItem.setRightBarButton(backBarButton, animated: false)
    }
    
    @objc func saveButtonTapped() {
        
    }
    
    func setNavigationTitle(_ text: String) -> Void {
        navigationItem.title = text
        
        let navigation = UINavigationBar.appearance()
        let navigationFont = UIFont.appBoldFontWithSize(size: 20)
        let navigationLargeFont = UIFont.appBoldFontWithSize(size: 34)
        
        navigation.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: navigationFont]
        
        if #available(iOS 11, *){
            navigation.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: navigationLargeFont]
        }
        
    }

    func getCustomPicker() -> CustomPickerViewController
    {
        let customPicker = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomPickerViewController") as! CustomPickerViewController
        return customPicker
    }
}

