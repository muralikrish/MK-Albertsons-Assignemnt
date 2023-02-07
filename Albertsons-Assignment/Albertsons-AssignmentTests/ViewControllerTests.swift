//
//  ViewControllerTests.swift
//  Albertsons-AssignmentTests
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/7/23.
//

import XCTest
@testable import Albertsons_Assignment

class ViewControllerTests: XCTestCase {
    var vc: ViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyBoard.instantiateViewController(identifier: "ViewController")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThatUpdateUIIsUpdatingTheElements() {
        //Given
        let fact = "Cats are great"
        let data = Data()
        _ = vc?.view
        vc?.viewModel = ViewModel(fact: fact, imageData: data)
        
        //When
        vc?.updateUI()
        
        //Then
        XCTAssertEqual(vc?.fact.text, fact)
        XCTAssertNil(vc?.imageView.image?.pngData())
    }
    
    func testSetUpUI() {
        //Given
        //When
        _ = vc?.view
        
        //Then
        XCTAssertEqual(vc?.navigationItem.title, "Cats Information")
    }

}
