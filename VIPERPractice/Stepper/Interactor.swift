//
//  Interactor.swift
//  VIPERPractice
//
//  Created by Immanuel on 07/01/25.
//

import Foundation

// Interactor to Presenter
protocol InteractorToPresenterProtocol: AnyObject {
    func showCurrentCount(_ count: Int?)
}

class Interactor {
    
    weak var presenter: InteractorToPresenterProtocol?
    let countStore: CountStore
    
    init(countStore: CountStore) {
        self.countStore = countStore
    }
    
}

extension Interactor: PresenterToInteractorProtocol {
    
    func getCount() {
        let count = countStore.fetchCount()
        presenter?.showCurrentCount(count)
    }
    
    func incrementCount() {
        let count = (countStore.fetchCount() ?? 0) + 1
        
        countStore.updateCount(count)
        presenter?.showCurrentCount(count)
    }
    
    func decrementCount() {
        let count = (countStore.fetchCount() ?? 0) - 1
        
        countStore.updateCount(count)
        presenter?.showCurrentCount(count)
    }
    
}
