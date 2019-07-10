//
//  AdditionalInformationViewController.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 07/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class AdditionalInformationViewController: BaseViewController {
    
    @IBOutlet weak var additionalInfo: CVTextView!
    
    private(set) var infoViewModel: AdditionalInformationViewModel?
    
    var infoModel: AdditionalInformationModel? {
        didSet {
            guard let infoModel = infoModel else { return }
            infoViewModel = AdditionalInformationViewModel.init(infoModel: infoModel)
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
    
    // MARK:- User Defined
    fileprivate func initializeSetup() {
        // Setting Navigation Bar
        setNavigationBackButton()
        setNavigationRightButton()
        setNavigationTitle(CreatCVTitle.additionalInfo)
        setupDelegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        infoModel = kAppSettingManager.additionalInfoModel
    }
    
    private func updateTextFields() {
        additionalInfo.text = infoModel?.detail
    }
    
    private func setupDelegate() {
        additionalInfo.delegate = self
    }
    
    override func saveButtonTapped() {
        kAppSettingManager.additionalInfoModel = infoModel ?? AdditionalInformationModel()
    }
}

extension AdditionalInformationViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        additionalInfo.text = textView.text
        infoModel?.detail = textView.text
    }
}
