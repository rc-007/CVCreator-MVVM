//
//  ProjectDetailsViewController.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 07/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class ProjectDetailsViewController: BaseViewController {

    @IBOutlet weak var projectName1: CVTextField!
    @IBOutlet weak var technology1: CVTextField!
    @IBOutlet weak var duration1: CVTextField!
    @IBOutlet weak var description1: UITextView!
    @IBOutlet weak var projectName2: CVTextField!
    @IBOutlet weak var technology2: CVTextField!
    @IBOutlet weak var duration2: CVTextField!
    @IBOutlet weak var description2: UITextView!
    
    private(set) var projectViewModel: ProjectDetailViewModel?
    
    var projectModel: ProjectModel? {
        didSet {
            guard let projectModel = projectModel else { return }
            projectViewModel = ProjectDetailViewModel(projectModel: projectModel)
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
        projectModel = kAppSettingManager.projectModel
    }
    
    // MARK:- User Defined
    private func initializeSetup() {
        // Setting Navigation Bar
        setNavigationBackButton()
        setNavigationRightButton()
        setNavigationTitle(CreatCVTitle.pastProject)
        
        // Setting Textfield and Textview delegates
        setupDelegate()
    }
    
    private func updateTextFields() {
        projectName1.text = projectModel?.project1
        projectName2.text = projectModel?.project2
        technology1.text = projectModel?.technology1
        technology2.text = projectModel?.technology2
        description1.text = projectModel?.description1
        description2.text = projectModel?.description2
        duration1.text = projectModel?.duration1
        duration2.text = projectModel?.duration2
    }
    
    private func setupDelegate() {
        projectName1.cvDelegate = self
        projectName2.cvDelegate = self
        duration1.cvDelegate = self
        duration2.cvDelegate = self
        technology1.cvDelegate = self
        technology2.cvDelegate = self
        description1.delegate = self
        description2.delegate = self
    }
    
    override func saveButtonTapped() {
        kAppSettingManager.projectModel = projectModel ?? ProjectModel()
    }
}


extension ProjectDetailsViewController: CVTextfieldDelegate {
    func changeText(textField: CVTextField) {
        
        // Saving data in shared class with respect to objectKey
        // ObjectKey is defined in storyboard file as in IBInspactable
        
        projectModel?.setValueWithTextField(key: ProjectModel.CodingKeys(rawValue: textField.objectKey)!, value: textField.text ?? "")
    }
}


extension ProjectDetailsViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let key = textView == description1 ? "description1" : "description2"
        projectModel?.setValueWithTextField(key: ProjectModel.CodingKeys(rawValue: key)!, value: textView.text ?? "")
    }
}
