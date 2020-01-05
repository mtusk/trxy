//
//  DetailViewModel.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var testResult: TestResult
    
    init(testResult: TestResult) {
        self.testResult = testResult
    }
}

