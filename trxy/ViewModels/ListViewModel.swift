//
//  ListViewModel.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var fileName: String
    @Published var testResults: [TestResult]
    
    init(fileName: String, testResults: [TestResult]) {
        self.fileName = fileName
        self.testResults = testResults
    }
}
