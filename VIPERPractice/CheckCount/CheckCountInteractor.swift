//
//  CheckCountInteractor.swift
//  VIPERPractice
//
//  Created by Immanuel on 07/01/25.
//

import Foundation

protocol CheckCountInteractorToPresenterProtocol: AnyObject {
    func showCurrentCount(_ count: String)
}

class CheckCountInteractor {
    weak var presenter: CheckCountInteractorToPresenterProtocol?
}

extension CheckCountInteractor: CheckCountPresenterToInteractorProtocol {
    
    func getCount() {
        let count = UserDefaults.standard.value(forKey: "count") as? Int ?? 0
        presenter?.showCurrentCount(String(count))
    }
    
}
