//
//  EducationViewController.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 07/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class EducationViewController: BaseViewController {

    // IBOutlets
    @IBOutlet weak var universityName: CVTextField!
    @IBOutlet weak var courseName: CVTextField!
    @IBOutlet weak var fromDate: CVTextField!
    @IBOutlet weak var toDate: CVTextField!
    
    private(set) var educationViewModel: EducationViewModel?
    
    var educationModel: EducationModel? {
        didSet {
            guard let educationModel = educationModel else { return }
            self.educationViewModel = EducationViewModel.init(educationModel: educationModel)
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
        educationModel = kAppSettingManager.educationModel
    }
    
    // MARK:- User Defined
    fileprivate func initializeSetup() {
        // Setting Navigation Bar
        setNavigationBackButton()
        setNavigationRightButton()
        setNavigationTitle(CreatCVTitle.education)
        setDelegate()
    }
    
    fileprivate func setDelegate() {
        universityName.cvDelegate = self
        courseName.cvDelegate = self
        fromDate.delegate = self
        toDate.delegate = self
    }
    
    fileprivate func openDatePicker(selectedIndex: Int){
        let customPicker = self.getCustomPicker()
        customPicker.isDatePicker = true
        customPicker.pickerDelegate = self
        customPicker.pickerMode = .Date
        customPicker.selectedIndex = selectedIndex
        customPicker.minDate = Date()
        
        view.endEditing(true)
        DispatchQueue.main.async {
            self.view.endEditing(true)
            customPicker.modalPresentationStyle = .custom
            self.navigationController?.present(customPicker, animated: true, completion: {
            })
        }
    }
    
    override func saveButtonTapped() {
        kAppSettingManager.educationModel = educationModel ?? EducationModel()
    }
}

// MARK:- TextField Delegates

extension EducationViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == fromDate || textField == toDate{
            let index = textField == fromDate ? 0 : 1
            openDatePicker(selectedIndex: index)
        }
        return false
    }
}

extension EducationViewController: CVTextfieldDelegate {
    func changeText(textField: CVTextField) {
        
        // Saving data in shared class with respect to objectKey
        // ObjectKey is defined in storyboard file as in IBInspactable
        
        educationModel?.setValueWithTextField(key: EducationModel.CodingKeys(rawValue: textField.objectKey)!, value: textField.text ?? "")
    }
}

extension EducationViewController: PickerProtocol{

    func selectedDate(selectedDate: Date, index: Int) {
        let dateString = Date().dateOfBirth(selectedDate)
        if index == 0 {
            fromDate.text = dateString
            educationModel?.fromDate = dateString
        } else {
            toDate.text = dateString
            educationModel?.toDate = dateString
        }
    }
}

extension EducationViewController {
    
    private func updateTextFields() {
        universityName.text = educationViewModel?.universityName
        courseName.text = educationViewModel?.courseName
        fromDate.text = educationViewModel?.fromDate
        toDate.text = educationViewModel?.toDate
    }
}
