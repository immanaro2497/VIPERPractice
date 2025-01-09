//
//  StepperTests.swift
//  VIPERPracticeTests
//
//  Created by Immanuel on 08/01/25.
//

import XCTest
@testable import VIPERPractice

final class StepperTests: XCTestCase {
    private var countViewModel: CountViewModel!
    
    func test_loadData() {
        countViewModel.loadData()
        
        XCTAssertEqual(countViewModel.count, "0")
    }
    
    func test_incrementCount() {
        countViewModel.incrementCount()
        
        XCTAssertEqual(countViewModel.count, "1")
    }
    
    func test_decrementCount() {
        countViewModel.incrementCount()
        countViewModel.decrementCount()
        
        XCTAssertEqual(countViewModel.count, "0")
    }
    
    func test_incrementCountTwice() {
        countViewModel.incrementCount()
        XCTAssertEqual(countViewModel.count, "1")
        
        countViewModel.incrementCount()
        XCTAssertEqual(countViewModel.count, "2")
    }

}

extension StepperTests {
    
    override func setUp() {
        countViewModel = CountViewModel(countStore: MockCountStore())
    }
    
    override func tearDown() {
        countViewModel = nil
    }
    
}
