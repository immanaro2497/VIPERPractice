//
//  StepperTests.swift
//  VIPERPracticeTests
//
//  Created by Immanuel on 08/01/25.
//

import XCTest
@testable import VIPERPractice

final class StepperTests: XCTestCase {
    private var presenter: ViewToPresenterProtocol!
    private var view: PresenterToViewProtocol!
    
    func test_loadData() {
        presenter.loadData()
        
        XCTAssertEqual(getCountFromView(), "0")
    }
    
    func test_incrementCount() {
        presenter.incrementCount()
        
        XCTAssertEqual(getCountFromView(), "1")
    }
    
    func test_decrementCount() {
        presenter.incrementCount()
        presenter.decrementCount()
        
        XCTAssertEqual(getCountFromView(), "0")
    }
    
    func test_incrementCountTwice() {
        presenter.incrementCount()
        XCTAssertEqual(getCountFromView(), "1")
        
        presenter.incrementCount()
        XCTAssertEqual(getCountFromView(), "2")
    }
    
    // MARK: Helper
    func getCountFromView() -> String? {
        if let stepperViewSpy = view as? StepperViewSpy {
            return stepperViewSpy.count
        }
        return nil
    }

}

extension StepperTests {
    
    override func setUp() {
        
        let stepperPresenter = Presenter()
        
        view = StepperViewSpy()
        stepperPresenter.view = view
        
        let mockCountStore: CountStore = MockCountStore()
        
        let interactor = Interactor(countStore: mockCountStore)
        stepperPresenter.interactor = interactor
        interactor.presenter = stepperPresenter
        
        presenter = stepperPresenter
    }
    
    override func tearDown() {
        presenter = nil
        view = nil
    }
    
}
