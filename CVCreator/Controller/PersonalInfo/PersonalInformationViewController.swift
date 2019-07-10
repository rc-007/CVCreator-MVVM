//
//  PersonalInformationViewController.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 08/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class PersonalInformationViewController: BaseViewController {

    // IBOutlets
    @IBOutlet weak var firstName: CVTextField!
    @IBOutlet weak var lastName: CVTextField!
    @IBOutlet weak var phoneNumner: CVTextField!
    @IBOutlet weak var emailId: CVTextField!
    @IBOutlet weak var addressLine1: CVTextField!
    @IBOutlet weak var addressLine2: CVTextField!
    @IBOutlet weak var dateOfBirth: CVTextField!
    
    private(set) var infoViewModel: PersonalInfoViewModel?

    var personalInfo: PersonalInfoModel? {
        didSet {
            guard let personalInfo = personalInfo else { return }
            infoViewModel = PersonalInfoViewModel.init(personalInfo: personalInfo)
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
        personalInfo = kAppSettingManager.personalInfoModel
    }
    
    // MARK:- User Defined
    
    fileprivate func initializeSetup() {
        // Setting Navigation Bar
        setNavigationBackButton()
        setNavigationRightButton()
        setNavigationTitle(CreatCVTitle.personalInfo)
        
        setDelegate()
    }
    
    fileprivate func setDelegate() {
        firstName.cvDelegate = self
        lastName.cvDelegate = self
        phoneNumner.cvDelegate = self
        emailId.cvDelegate = self
        addressLine1.cvDelegate = self
        addressLine2.cvDelegate = self
        dateOfBirth.delegate = self
    }
    
    fileprivate func openDatePicker(){
        let customPicker = self.getCustomPicker()
        customPicker.isDatePicker = true
        customPicker.pickerDelegate = self
        customPicker.pickerMode = .Date
        customPicker.selectedDate = infoViewModel?.selectedDate == Date() ? Date().set1900Date : infoViewModel?.selectedDate
        customPicker.maxDate = Date()
        
        view.endEditing(true)
        DispatchQueue.main.async {
            self.view.endEditing(true)
            customPicker.modalPresentationStyle = .custom
            self.navigationController?.present(customPicker, animated: true, completion: {
            })
        }
    }
    
    override func saveButtonTapped() {
        kAppSettingManager.personalInfoModel = personalInfo ?? PersonalInfoModel()
    }
}

extension PersonalInformationViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == dateOfBirth{
            openDatePicker()
        }
        return false
    }
}

extension PersonalInformationViewController: CVTextfieldDelegate {
    func changeText(textField: CVTextField) {
        
        // Saving data in shared class with respect to objectKey
        // ObjectKey is defined in storyboard file as in IBInspactable
        
         personalInfo?.setValueWithTextField(key: PersonalInfoModel.CodingKeys(rawValue: textField.objectKey)!, value: textField.text ?? "")
    }
}

extension PersonalInformationViewController: PickerProtocol{
    func selectedDate(selectedDate: Date, index: Int) {
        infoViewModel?.selectedDate = selectedDate
        dateOfBirth.text = Date().dateOfBirth(selectedDate)
        personalInfo?.dob = dateOfBirth.text ?? ""
    }
}

extension PersonalInformationViewController {
    
    private func updateTextFields() {
        firstName.text = infoViewModel?.firstName ?? ""
        lastName.text = infoViewModel?.lastName ?? ""
        emailId.text = infoViewModel?.emailId ?? ""
        phoneNumner.text = infoViewModel?.phoneNumber ?? ""
        addressLine1.text = infoViewModel?.address1 ?? ""
        addressLine2.text = infoViewModel?.address2 ?? ""
        dateOfBirth.text = infoViewModel?.dob ?? ""
    }
}
