//
//  LinioChallengeTests.swift
//  LinioChallengeTests
//
//  Created by Pablo Ramirez on 6/25/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import XCTest
@testable import LinioChallenge

class LinioChallengeTests: XCTestCase {
    
    private var expectation: XCTestExpectation!
    private var serviceViewModel: ServiceViewModel = ServiceViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        expectation = self.expectation(description: "waitingResponse")
        
        self.errorCatalog()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFavoritesService(){
        serviceViewModel.onSuccessFavoritesService = {(_ response: [Favorite]) -> Void in
            print(response)
            XCTAssert(true, "El servicio respondió correctamente")
            self.expectation.fulfill()
        }
        
        serviceViewModel.performFavoritesService()
        
        waitForExpectations(timeout: 60, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func errorCatalog(){
//        serviceViewModel.onFormatError = { (_ message: String) -> Void in
//            XCTAssert(false, message)
//            self.expectation.fulfill()
//        }
        serviceViewModel.onServiceError  = {(_ error: ServiceError)  -> Void in
            XCTAssert(false, error.message)
            self.expectation.fulfill()
        }
    }
    
}
