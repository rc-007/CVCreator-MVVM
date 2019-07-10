//
//  DashboardViewController.swift
//  CVCreater
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    @IBOutlet var dashboardViewModel: DashboardViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK :- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeSetup()
    }

    // MARK:- User Defined
    fileprivate func initializeSetup() {
        // Setting Navigation Bar
        setNavigationBackButton()
        setNavigationTitle(TextValues.createCV)
        
        // fetching data
        dashboardViewModel.loadOption()
        
        // Load Nib
        tableView.register(UINib.init(nibName: "DashboardOptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DashboardOptionTableViewCell")
    }
    
    fileprivate func getIdentifier(indexpath: IndexPath) -> String {
        var identifier = ""
        switch indexpath.row {
        case 0:
            identifier = SegueIdentifier.personal
        case 1:
            identifier = SegueIdentifier.education
        case 2:
            identifier = SegueIdentifier.topic
        case 3:
            identifier = SegueIdentifier.pastProject
        case 4:
            identifier = SegueIdentifier.currentCompanyDetails
        default:
            identifier = SegueIdentifier.additionalInfo
        }
        return identifier
    }
}


extension DashboardViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardViewModel.optionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOptionTableViewCell") as! DashboardOptionTableViewCell
        
        let data = dashboardViewModel.optionArray[indexPath.row]
        cell.titleLabel.text = data.title
        cell.titleLabel.textColor = UIColor.AppTextFieldBlackColor()
        cell.colorBackgroundView.backgroundColor = data.color
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


extension DashboardViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: getIdentifier(indexpath: indexPath), sender: nil)
    }
}

