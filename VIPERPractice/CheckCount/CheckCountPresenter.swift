//
//  CheckCountPresenter.swift
//  VIPERPractice
//
//  Created by Immanuel on 07/01/25.
//

import Foundation

protocol CheckCountPresenterToViewProtocol: AnyObject {
    func display(_ count: String)
}

protocol CheckCountPresenterToInteractorProtocol: AnyObject {
    func getCount()
}

class CheckCountPresenter: ObservableObject {
    
    weak var view: CheckCountPresenterToViewProtocol?
    var interactor: CheckCountPresenterToInteractorProtocol?
    
    @Published var count: String = ""
    
}

extension CheckCountPresenter: CheckCountViewToPresenterProtocol {
    
    func loadData() {
        interactor?.getCount()
    }
    
}

extension CheckCountPresenter: CheckCountInteractorToPresenterProtocol {
    
    func showCurrentCount(_ count: Int?) {
        let count = String(count ?? 0)
        view?.display(count)
    }
    
}
