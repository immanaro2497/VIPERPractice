//
//  CountViewModel.swift
//  VIPERPractice
//
//  Created by Immanuel on 09/01/25.
//

import Foundation

class CountViewModel: ObservableObject {
    
    @Published var count: String = ""
    let countStore: CountStore
    
    init(countStore: CountStore) {
        self.countStore = countStore
    }
    
    func loadData() {
        let count = countStore.fetchCount()
        
        self.count = String(count ?? 0)
    }
    
    func incrementCount() {
        let count = (countStore.fetchCount() ?? 0) + 1
        
        countStore.updateCount(count)
        self.count = String(count)
    }
    
    func decrementCount() {
        let count = (countStore.fetchCount() ?? 0) - 1
        
        countStore.updateCount(count)
        self.count = String(count)
    }
    
}
