//
//  Presenter.swift
//  VIPERPractice
//
//  Created by Immanuel on 06/01/25.
//

import Foundation

protocol CountView: AnyObject {
    func display(_ count: String)
}

class Presenter {
    
    weak var countView: CountView?
    
    init(countView: CountView?) {
        self.countView = countView
    }
    
    func loadData() {
        let count = UserDefaults.standard.value(forKey: "count") as? Int ?? 0
        countView?.display(String(count))
    }
    
    func incrementCount() {
        let count = (UserDefaults.standard.value(forKey: "count") as? Int ?? 0) + 1
        
        UserDefaults.standard.setValue(count, forKey: "count")
        
        countView?.display(String(count))
    }
    
    func decrementCount() {
        let count = (UserDefaults.standard.value(forKey: "count") as? Int ?? 0) - 1
        
        UserDefaults.standard.setValue(count, forKey: "count")
        
        countView?.display(String(count))
    }
    
}
