//
//  Interactor.swift
//  VIPERPractice
//
//  Created by Immanuel on 07/01/25.
//

import Foundation

// Interactor to Presenter
protocol InteractorToPresenterProtocol: AnyObject {
    func showCurrentCount(_ count: String)
}

class Interactor {
    
    weak var presenter: InteractorToPresenterProtocol?
    
}

extension Interactor: PresenterToInteractorProtocol {
    
    func getCount() {
        let count = UserDefaults.standard.value(forKey: "count") as? Int ?? 0
        presenter?.showCurrentCount(String(count))
    }
    
    func incrementCount() {
        let count = (UserDefaults.standard.value(forKey: "count") as? Int ?? 0) + 1
        
        UserDefaults.standard.setValue(count, forKey: "count")
        
        presenter?.showCurrentCount(String(count))
    }
    
    func decrementCount() {
        let count = (UserDefaults.standard.value(forKey: "count") as? Int ?? 0) - 1
        
        UserDefaults.standard.setValue(count, forKey: "count")
        
        presenter?.showCurrentCount(String(count))
    }
    
}
