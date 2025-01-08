//
//  CheckCountViewSpy.swift
//  VIPERPracticeTests
//
//  Created by Immanuel on 08/01/25.
//

import Foundation
@testable import VIPERPractice

class CheckCountViewSpy: CheckCountPresenterToViewProtocol {
    var count = ""
    
    func display(_ count: String) {
        self.count = count
    }
}
