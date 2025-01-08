//
//  Presenter.swift
//  VIPERPractice
//
//  Created by Immanuel on 06/01/25.
//

import Foundation

// Presenter to View
protocol PresenterToViewProtocol: AnyObject {
    func display(_ count: String)
}

// Presenter to Interactor
protocol PresenterToInteractorProtocol: AnyObject {
    func getCount()
    func incrementCount()
    func decrementCount()
}

// Presenter to Router
protocol PresenterToRouterProtocol: AnyObject {
    func pushCheckCountView(parentView: PresenterToViewProtocol?)
}

class Presenter {
    
    weak var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
}

extension Presenter: ViewToPresenterProtocol {
    
    func loadData() {
        interactor?.getCount()
    }
    
    func incrementCount() {
        interactor?.incrementCount()
    }
    
    func decrementCount() {
        interactor?.decrementCount()
    }
    
    func onSelectViewCount() {
        router?.pushCheckCountView(parentView: view)
    }
    
}

extension Presenter: InteractorToPresenterProtocol {
    
    func showCurrentCount(_ count: Int?) {
        let count = String(count ?? 0)
        view?.display(count)
    }
    
}
