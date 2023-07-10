//
//  MainCoordinatorTests.swift
//  Albertsons-AssignmentTests
//
//  Created by MURALIKRISHNA VEERAMOSU on 10/07/23.
//

import XCTest
@testable import Albertsons_Assignment

final class MainCoordinatorTests: XCTestCase {
    var coordinator: MainCoordinator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        coordinator = MainCoordinator(navigationController: UINavigationController())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        coordinator = nil
    }
    
    func testStart() {
        coordinator.testHooks.start()
        XCTAssertNotNil(coordinator.testHooks.target.viewController)
        XCTAssertNotNil(coordinator.testHooks.target.navigationController)
        XCTAssertNotNil(coordinator.navigationController)
    }
}
