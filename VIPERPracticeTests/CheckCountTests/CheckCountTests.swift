//
//  CheckCountTests.swift
//  VIPERPracticeTests
//
//  Created by Immanuel on 08/01/25.
//

import XCTest
@testable import VIPERPractice

final class CheckCountTests: XCTestCase {
    private var presenter: CheckCountViewToPresenterProtocol!
    private var view: CheckCountPresenterToViewProtocol!
    
    func test_loadDataWithZero() {
        presenter.loadData()
        
        XCTAssertEqual(getCountFromView(), "0")
    }
    
    func test_loadDataWithNonZero() {
        setCountToView(11)
        presenter.loadData()
        
        XCTAssertEqual(getCountFromView(), "11")
    }
    
    // MARK: Helper
    func setCountToView(_ count: Int) {
        if let checkCountPresenter = presenter as? CheckCountPresenter,
           let checkCountInteractor = checkCountPresenter.interactor as? CheckCountInteractor,
           let countStore = checkCountInteractor.countStore as? MockCountStore {
            countStore.updateCount(count)
        }
    }
    
    func getCountFromView() -> String? {
        if let stepperViewSpy = view as? CheckCountViewSpy {
            return stepperViewSpy.count
        }
        return nil
    }
    
}

extension CheckCountTests {
    
    override func setUp() {
        let checkCountPresenter = CheckCountPresenter()
        
        view = CheckCountViewSpy()
        checkCountPresenter.view = view
        
        let mockCountStore: CountStore = MockCountStore()
        
        let interactor = CheckCountInteractor(countStore: mockCountStore)
        checkCountPresenter.interactor = interactor
        interactor.presenter = checkCountPresenter
        
        presenter = checkCountPresenter
    }
    
    override func tearDown() {
        presenter = nil
        view = nil
    }
    
}
