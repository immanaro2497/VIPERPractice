//
//  StepperViewSpy.swift
//  VIPERPracticeTests
//
//  Created by Immanuel on 08/01/25.
//

import Foundation
@testable import VIPERPractice

class StepperViewSpy: PresenterToViewProtocol {
    var count = ""
    
    func display(_ count: String) {
        self.count = count
    }
}
