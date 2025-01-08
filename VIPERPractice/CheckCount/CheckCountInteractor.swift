//
//  CheckCountInteractor.swift
//  VIPERPractice
//
//  Created by Immanuel on 07/01/25.
//

import Foundation

protocol CheckCountInteractorToPresenterProtocol: AnyObject {
    func showCurrentCount(_ count: Int?)
}

class CheckCountInteractor {
    weak var presenter: CheckCountInteractorToPresenterProtocol?
    let countStore: CountStore = UserDefaultsStore()
}

extension CheckCountInteractor: CheckCountPresenterToInteractorProtocol {
    
    func getCount() {
        let count = countStore.fetchCount()
        presenter?.showCurrentCount(count)
    }
    
}
