//
//  TopicOfKnowladgeViewController.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 07/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class TopicOfKnowladgeViewController: BaseViewController {
    
    @IBOutlet weak var knowledge1: CVTextField!
    @IBOutlet weak var experience1: CVTextField!
    @IBOutlet weak var knowledge2: CVTextField!
    @IBOutlet weak var experience2: CVTextField!
    @IBOutlet weak var knowledge3: CVTextField!
    @IBOutlet weak var experience3: CVTextField!
    @IBOutlet weak var knowledge4: CVTextField!
    @IBOutlet weak var experience4: CVTextField!
    @IBOutlet weak var knowledge5: CVTextField!
    @IBOutlet weak var experience5: CVTextField!
    
    private(set) var topicViewModel: TopicOfKnowladgeViewModel?
    
    var topicModel: TopicOfKnowladgeModel? {
        didSet {
            guard let topicModel = topicModel else { return }
            topicViewModel = TopicOfKnowladgeViewModel.init(topicModel: topicModel)
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
        topicModel = kAppSettingManager.topicModel
    }
    
    // MARK:- User Defined
    private func initializeSetup() {
        // Setting Navigation Bar
        setNavigationBackButton()
        setNavigationRightButton()
        setNavigationTitle(CreatCVTitle.TopicsOfKnowladge)
        setupDelegate()
    }
    
    private func updateTextFields() {
        knowledge1.text = topicViewModel?.knowledge1
        knowledge2.text = topicViewModel?.knowledge2
        knowledge3.text = topicViewModel?.knowledge3
        knowledge4.text = topicViewModel?.knowledge4
        knowledge5.text = topicViewModel?.knowledge5
        experience1.text = topicViewModel?.experience1
        experience2.text = topicViewModel?.experience2
        experience3.text = topicViewModel?.experience3
        experience4.text = topicViewModel?.experience4
        experience5.text = topicViewModel?.experience5
    }
    
    private func setupDelegate() {
        experience1.cvDelegate = self
        experience2.cvDelegate = self
        experience3.cvDelegate = self
        experience4.cvDelegate = self
        experience5.cvDelegate = self
        knowledge1.cvDelegate = self
        knowledge2.cvDelegate = self
        knowledge3.cvDelegate = self
        knowledge4.cvDelegate = self
        knowledge5.cvDelegate = self
    }
    
    override func saveButtonTapped() {
        kAppSettingManager.topicModel = topicModel ?? TopicOfKnowladgeModel()
    }
}


extension TopicOfKnowladgeViewController: CVTextfieldDelegate {
    func changeText(textField: CVTextField) {
        
        // Saving data in shared class with respect to objectKey
        // ObjectKey is defined in storyboard file as in IBInspactable
        
        topicModel?.setValueWithTextField(key: TopicOfKnowladgeModel.CodingKeys(rawValue: textField.objectKey)!, value: textField.text ?? "")
    }
}
