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

class CheckCountPresenter {
    
    weak var view: CheckCountPresenterToViewProtocol?
    var interactor: CheckCountPresenterToInteractorProtocol?
    
}

extension CheckCountPresenter: CheckCountViewToPresenterProtocol {
    
    func loadData() {
        interactor?.getCount()
    }
    
}

extension CheckCountPresenter: CheckCountInteractorToPresenterProtocol {
    
    func showCurrentCount(_ count: String) {
        view?.display(count)
    }
    
}
