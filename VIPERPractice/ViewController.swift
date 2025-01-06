//
//  ViewController.swift
//  VIPERPractice
//
//  Created by Immanuel on 06/01/25.
//

import UIKit

class ViewController: UIViewController, CountView {
    
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var incrementButton: UIButton!
    @IBOutlet var decrementButton: UIButton!
    @IBOutlet var viewCount: UIButton!
    
    var presenter: Presenter?
    
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
        let count = UserDefaults.standard.value(forKey: "count") as? Int ?? 0
        navigationController?.pushViewController(ViewCountViewController(count: String(count)), animated: true)
    }
    
    func display(_ count: String) {
        countLabel.text = count
    }

}

class ViewCountViewController: UIViewController {
    let count: String
    var countLabel: UILabel!
    
    init(count: String) {
        self.count = count
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.text = count
        view.addSubview(countLabel)
        
        countLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
}
