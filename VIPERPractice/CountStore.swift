//
//  CountStore.swift
//  VIPERPractice
//
//  Created by Immanuel on 08/01/25.
//

import Foundation

protocol CountStore: AnyObject {
    func fetchCount() -> Int?
    func updateCount(_ count: Int)
}

class UserDefaultsStore {
    
    let store: UserDefaults = UserDefaults.standard
    static let countKey: String = "count"
    
}

extension UserDefaultsStore: CountStore {
    
    func fetchCount() -> Int? {
        store.value(forKey: UserDefaultsStore.countKey) as? Int
    }
    
    func updateCount(_ count: Int) {
        store.setValue(count, forKey: UserDefaultsStore.countKey)
    }
    
}
