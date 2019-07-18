//
//  UtilityTests.swift
//  CVCreatorTests
//
//  Created by Rahul Chouhan on 18/07/19.
//  Copyright © 2019 Rahul Chouhan. All rights reserved.
//

import XCTest
@testable import CVCreator

class UtilityTests: XCTestCase {

    func testFetDocumentDirectory(){
        let url = Utility().getDocumentsDirectory()
        XCTAssertNotNil(url)
    }
}
