//
//  ViewController.swift
//  VIPERPractice
//
//  Created by Immanuel on 06/01/25.
//

import UIKit

// User input to Presenter
protocol ViewToPresenterProtocol: AnyObject {
    func loadData()
    func incrementCount()
    func decrementCount()
    func onSelectViewCount()
}

class ViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var incrementButton: UIButton!
    @IBOutlet var decrementButton: UIButton!
    @IBOutlet var viewCount: UIButton!
    
    var presenter: ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
    }
    
    @IBAction func onIncrement(_ sender: UIButton) {
        presenter?.incrementCount()
    }
    
    @IBAction func onDecrement(_ sender: UIButton) {
        presenter?.decrementCount()
    }
    
    @IBAction func viewCount(_ sender: UIButton) {
        presenter?.onSelectViewCount()
    }

}

extension ViewController: PresenterToViewProtocol {
    
    func display(_ count: String) {
        countLabel.text = count
    }
    
}
