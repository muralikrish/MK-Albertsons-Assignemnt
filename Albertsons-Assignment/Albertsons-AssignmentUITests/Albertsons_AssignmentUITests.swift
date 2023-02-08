//
//  Albertsons_AssignmentUITests.swift
//  Albertsons-AssignmentUITests
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/5/23.
//

import XCTest

class Albertsons_AssignmentUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThatUIElementsPresent() {
        let app = XCUIApplication()
        app.launch()
        let image = app.images["ViewController.imageView"]
        XCTAssert(image.exists) // checking imageView present.
        let label = app.staticTexts["ViewController.fact"]
        XCTAssert(label.exists) //chekcing if label present
    }

}
