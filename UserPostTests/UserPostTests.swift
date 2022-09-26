//
//  UserPostTests.swift
//  UserPostTests
//
//  Created by Luis Santana on 25/9/22.
//

import XCTest
@testable import UserPost
import UIKit
class UserPostTests: XCTestCase {
  
    
    var controller: MainController?
    var expectation = XCTestExpectation()
    override func setUpWithError() throws {
        self.controller = MainController()
    }
      
    override func tearDownWithError() throws {
        controller = nil
    }
    
    func testGetAllUsers() throws{
        self.expectation = expectation(description: "posts")
        self.controller?.viewDidLoad()
        DispatchQueue.main.async {
            self.expectation.fulfill()
        }
        XCTAssert(!self.controller!.users.isEmpty)
        wait(for: [expectation], timeout: 3.0)

    }
    
    
}
