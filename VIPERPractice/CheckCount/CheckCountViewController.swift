//
//  CheckCountViewController.swift
//  VIPERPractice
//
//  Created by Immanuel on 07/01/25.
//

import Foundation
import UIKit

protocol CheckCountViewToPresenterProtocol {
    func loadData()
}

class CheckCountViewController: UIViewController {
    
    var countLabel: UILabel!
    
    var presenter: CheckCountViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        createCountLabel()
        presenter?.loadData()
    }
    
    func createCountLabel() {
        countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countLabel)
        
        countLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}

extension CheckCountViewController: CheckCountPresenterToViewProtocol {
    
    func display(_ count: String) {
        countLabel.text = count
    }
    
}
