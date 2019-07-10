//
//  CurrentCompanyViewController.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 07/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class CurrentCompanyViewController: BaseViewController {

    @IBOutlet weak var companyName: CVTextField!
    @IBOutlet weak var designation: CVTextField!
    @IBOutlet weak var experience: CVTextField!
    @IBOutlet weak var achievements: CVTextView!
    
    
    private(set) var companyViewModel: CompanyDetailViewModel?
    
    var companyModel: CompanyModel? {
        didSet {
            guard let companyModel = companyModel else { return }
            companyViewModel = CompanyDetailViewModel.init(companyModel: companyModel)
            DispatchQueue.main.async {
                self.updateTextFields()
            }
        }
    }
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        companyModel = kAppSettingManager.companyModel
    }
    
    // MARK:- User Defined
    fileprivate func initializeSetup() {
        // Setting Navigation Bar
        setNavigationBackButton()
        setNavigationRightButton()
        setNavigationTitle(CreatCVTitle.currentDetails)
        setupDelegate()
    }
    
    private func updateTextFields() {
        companyName.text = companyModel?.companyName
        designation.text = companyModel?.designation
        experience.text = companyModel?.experience
        achievements.text = companyModel?.achievements
    }
    
    private func setupDelegate() {
        companyName.cvDelegate = self
        designation.cvDelegate = self
        experience.cvDelegate = self
        achievements.delegate = self
    }
    
    override func saveButtonTapped() {
        kAppSettingManager.companyModel = companyModel ?? CompanyModel()
    }
}


extension CurrentCompanyViewController: CVTextfieldDelegate {
    func changeText(textField: CVTextField) {
        
        // Saving data in shared class with respect to objectKey
        // ObjectKey is defined in storyboard file as in IBInspactable
        
       companyModel?.setValueWithTextField(key: CompanyModel.CodingKeys(rawValue: textField.objectKey)!, value: textField.text ?? "")
    }
}

extension CurrentCompanyViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        achievements.text = textView.text
        companyModel?.achievements = textView.text
    }
}
