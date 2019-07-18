//
//  HomeViewController.swift
//  CVCreater
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit


class HomeViewController: BaseViewController {

    @IBOutlet var homeViewModel: HomeViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // fetching opitons data
        homeViewModel.loadOption()
    }
    
    // MARK:- User Defined
    fileprivate func initializeSetup() {
        // Setting Navigation Bar
        
        setNavigationTitle(TextValues.home)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return TextValues.features.capitalized
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.optionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        let data = homeViewModel.optionArray[indexPath.row]
        cell.titleText.text = data.title
        cell.titleText.textColor = UIColor.AppTextFieldBlackColor()
        cell.titleText.backgroundColor = data.color
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

extension HomeViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            // Fetching data from document directory
            homeViewModel.loadingDataFromDocumentDirectory()
            
            performSegue(withIdentifier: SegueIdentifier.dashboard, sender: nil)
        default:
            homeViewModel.saveDataInDirectory()
        }
    }
}

