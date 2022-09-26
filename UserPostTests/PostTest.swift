//
//  PostTest.swift
//  UserPostTests
//
//  Created by Luis Santana on 25/9/22.
//

import XCTest
@testable import UserPost
final class PostTest: XCTestCase {
    
    var controller: PostController?

    override func setUpWithError() throws {
        self.controller = PostController(userInfo: UserModel(id: 1, name: "Luis", username: "LSantana", email: "luisfernando96@live.com", address: Address(street: "test", suite: "test1", city: "Santo Domingo", zipcode: "2", geo: Geo(lat: "18181.0", lng: "773763.9")), phone: "8206489596", website: "https://www.test.com", company: Company(name: "Luis tECH", catchPhrase: "98987", bs: "8y89y9")))

        
    }

    override func tearDownWithError() throws {
        self.controller = nil
    }

    func testGetPostByUser() throws {
        let exp = XCTestExpectation(description: "test")
        self.controller?.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            exp.fulfill()
        })
        wait(for: [exp], timeout: 3.0, enforceOrder: true)
        XCTAssert(!self.controller!.posts.isEmpty)

    }
}
