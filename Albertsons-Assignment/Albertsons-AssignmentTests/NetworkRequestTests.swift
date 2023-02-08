//
//  NetworkRequestTests.swift
//  Albertsons-AssignmentTests
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/7/23.
//

import XCTest
@testable import Albertsons_Assignment

class NetworkRequestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThatMeowFactsRequestSuccessScenario() {
        let expectation = XCTestExpectation(description: "meow facts API suceess")
        NetworkRequests().makeMeowFactsRequest { (result: Result<FactResponse, Error>) in
            expectation.fulfill()
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTFail("meow facts API Failed \(error)")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testThatMeowFactsRequestFailureScenario() {
        let expectation = XCTestExpectation(description: "meow facts API Failure")
        let wrongMeowFactsUrl = "https://meowfacts.herokuap.com/"
        NetworkRequests().makeRequestWithUrl(with: wrongMeowFactsUrl, completion: { (result: Result<FactResponse, Error>) in
            expectation.fulfill()
            switch result {
            case .success(let data):
                XCTFail("meow facts API Failed \(data)")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        })
        wait(for: [expectation], timeout: 5)
    }
    
    func testmakeKittenImageRequestSuccessScenario() {
        let expectation = XCTestExpectation(description: "placekitten API Sucess")
        NetworkRequests().makeKittenImageRequest { (data) in
            expectation.fulfill()
            guard let data = data else {
                XCTFail("placekitten API Failed ")
                return
            }
            XCTAssertNotNil(data)
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testmakeKittenImageRequestFailureScenario() {
        let expectation = XCTestExpectation(description: "placekitten API Sucess")
        let wrongPlaceKittenUrl = "https://placekitte.com"
        NetworkRequests().downloadDataWithUrl(with: wrongPlaceKittenUrl, completion: { (data) in
            expectation.fulfill()
            guard let data = data else {
                XCTAssert(true)
                return
            }
            XCTFail("Data shouldn't available \(data)")
        })
        wait(for: [expectation], timeout: 5)
    }
}
