//
//  CheckCountTests.swift
//  VIPERPracticeTests
//
//  Created by Immanuel on 08/01/25.
//

import XCTest
@testable import VIPERPractice

final class CheckCountTests: XCTestCase {
    private var checkCountViewModel: CheckCountViewModel!
    
    func test_loadDataWithZero() {
        checkCountViewModel.loadData()
        
        XCTAssertEqual(checkCountViewModel.count, "0")
    }
    
    func test_loadDataWithNonZero() {
        setCountToViewModel(11)
        checkCountViewModel.loadData()
        
        XCTAssertEqual(checkCountViewModel.count, "11")
    }
    
    // MARK: Helper
    func setCountToViewModel(_ count: Int) {
        checkCountViewModel.countStore.updateCount(count)
    }
    
}

extension CheckCountTests {
    
    override func setUp() {
        checkCountViewModel = CheckCountViewModel(countStore: MockCountStore())
    }
    
    override func tearDown() {
        checkCountViewModel = nil
    }
    
}
