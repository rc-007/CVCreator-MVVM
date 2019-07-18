//
//  HomeViewControllerTests.swift
//  CVCreatorTests
//
//  Created by Rahul Chouhan on 17/07/19.
//  Copyright © 2019 Rahul Chouhan. All rights reserved.
//

import XCTest
@testable import CVCreator

class HomeViewControllerTests: XCTestCase {
    
//    var controller: HomeViewController!
//    var tableView: UITableView!
//    var dataSource: UITableViewDataSource!
//    var delegate: UITableViewDelegate!
    
    override func setUp() {
        super.setUp()
        
//        guard let vc = UIStoryboard(name: "Main", bundle: Bundle(for: HomeViewController.self))
//            .instantiateInitialViewController() as? HomeViewController else {
//                return XCTFail("Could not instantiate HomeViewController from main storyboard")
//        }
//
//        controller = vc
//        controller.loadViewIfNeeded()
//        tableView = controller.tableView
//
//        guard let ds = tableView.dataSource else {
//            return XCTFail("Controller's table view should have a table data source")
//        }
//
//        dataSource = ds
//        delegate = tableView.delegate
    }
    
//    func testTableViewHasCells() {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else {return}
//        
//        XCTAssertNotNil(cell,
//                        "TableView should be able to dequeue cell with identifier: 'Cell'")
//    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetAndGetResumeDataDictionary(){
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

