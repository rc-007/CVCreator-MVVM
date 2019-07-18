//
//  PersonalInformationViewControllerTests.swift
//  CVCreatorTests
//
//  Created by Rahul Chouhan on 18/07/19.
//  Copyright © 2019 Rahul Chouhan. All rights reserved.
//

import XCTest
@testable import CVCreator

class PersonalInformationViewControllerTests: XCTestCase {
    
    var resumeDict : [String: Any]?
    
    
    override func setUp() {
        super.setUp()
        //Dummy Array of Dictionary
        resumeDict = ["personalInfo" : ["firstName" : "Rahul",
                                        "lastName" : "Chouhan",
                                        "phoneNumber" : "9090909090",
                                        "emailId" : "rc@yopmail.com",
                                        "address1" : "Infosys",
                                        "address2" : "PUNE",
                                        "dob" : "01/01/2000"],
                      
                      "education" : ["universityName":"SDBCT",
                                     "courseName":"BE",
                                     "fromDate":"2009",
                                     "toDate":"2013"],
                      
                      "technicalExpertise" : [ "knowledge1" : "",
                                               "experience1" :"",
                                               "knowledge2" : "",
                                               "experience2" :"experience2",
                                               "knowledge3": "knowledge3",
                                               "experience3":"experience3",
                                               "knowledge4": "knowledge4",
                                               "experience4":"experience4",
                                               "knowledge5": "knowledge5",
                                               "experience5":"experience5"],
                      "projectExp" : ["project1": "project1",
                                      "project2":"project2",
                                      "technology1":"technology1",
                                      "technology2":"technology2",
                                      "duration1":"duration1",
                                      "duration2":"duration2",
                                      "description1":"description1",
                                      "description2":"description2"],
                      "pastExp" : [
                        "companyName": "companyName",
                        "designation":"designation",
                        "experience": "experience",
                        "achievements":"achievements"],
                        "additionalInfo" : [
                        "detail": "detail"]
        ]
        
    }
    
    override func tearDown() {
        super.tearDown()
        resumeDict = nil
    }
    
    func testSetAndGetResumeDataDictionary(){
        kAppSettingManager.saveResumeData(dictionary: resumeDict ?? [:])
        let getDict = kAppSettingManager.getResumeDataFromDictionary()
        XCTAssertNotNil(getDict)
        
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

