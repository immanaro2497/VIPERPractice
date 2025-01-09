//
//  CheckCountViewModel.swift
//  VIPERPractice
//
//  Created by Immanuel on 09/01/25.
//

import Foundation

class CheckCountViewModel: ObservableObject {
    
    @Published var count: String = ""
    
    let countStore: CountStore
    
    init(countStore: CountStore) {
        self.countStore = countStore
    }
    
    func loadData() {
        let count = countStore.fetchCount()
        self.count = String(count ?? 0)
    }
    
}
