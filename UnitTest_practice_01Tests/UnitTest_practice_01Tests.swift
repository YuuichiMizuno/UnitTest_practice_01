//
//  UnitTest_practice_01Tests.swift
//  UnitTest_practice_01Tests
//
//  Created by yuichi.watanabe on 2016/12/06.
//  Copyright © 2016年 yuuichi.watanabe. All rights reserved.
//

import XCTest
@testable import UnitTest_practice_01

class UnitTest_practice_01Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    
    // added
    
    func testShowWeather() {
        class VCMock:ViewController {
            override func getWeather(closure:(String) -> Void) {
                closure("test weather")
            }
        }
        
        let vcm:VCMock = VCMock()
            vcm.showWeather()
    }
    
}
