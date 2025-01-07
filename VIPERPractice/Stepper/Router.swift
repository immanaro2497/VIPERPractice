//
//  Router.swift
//  VIPERPractice
//
//  Created by Immanuel on 06/01/25.
//

import Foundation

class Router: PresenterToRouterProtocol {
    
    weak var presenter: InteractorToPresenterProtocol?
    
    func pushCheckCountView(parentView: PresenterToViewProtocol?) {
        if let viewController = parentView as? ViewController {
            let checkCountViewController = CheckCountViewController()
            
            let checkCountPresenter = CheckCountPresenter()
            checkCountPresenter.view = checkCountViewController
            
            let checkCountInteractor = CheckCountInteractor()
            checkCountInteractor.presenter = checkCountPresenter
            checkCountPresenter.interactor = checkCountInteractor
            
            checkCountViewController.presenter = checkCountPresenter
            
            viewController.navigationController?.pushViewController(checkCountViewController, animated: true)
        }
    }
    
}
