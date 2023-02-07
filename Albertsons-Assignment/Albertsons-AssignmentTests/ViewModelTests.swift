//
//  ViewModelTests.swift
//  Albertsons-AssignmentTests
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/7/23.
//

import XCTest
@testable import Albertsons_Assignment

class ViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThatViewModelIsinitializing() {
        //Given
        let fact = "Cats are kind"
        let data = Data()
        
        //When
        let viewModel = ViewModel(fact: fact, imageData: data)
        
        //Then
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.fact, fact)
        XCTAssertEqual(viewModel.imageData, Data())
    }
}
