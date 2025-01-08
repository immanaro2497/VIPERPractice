//
//  MockCountStore.swift
//  VIPERPracticeTests
//
//  Created by Immanuel on 08/01/25.
//

import Foundation
@testable import VIPERPractice

class MockCountStore: CountStore {
    var count: Int?
    
    func fetchCount() -> Int? {
        return count
    }
    
    func updateCount(_ count: Int) {
        self.count = count
    }
}
