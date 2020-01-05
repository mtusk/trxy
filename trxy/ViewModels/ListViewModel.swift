//
//  ListViewModel.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var testResults: [TestResult] = []
    
    init(testResults: [TestResult]) {
        self.testResults = testResults
    }
    
    @objc func openFile() {
        self.testResults = [
            TestResult(
                guid: "1234",
                id: "testId1",
                name: "testName1",
                testClassName: "testClassName1",
                outcome: "testOutcome1"),
            TestResult(
                guid: "2345",
                id: "testId2",
                name: "testName2",
                testClassName: "testClassName2",
                outcome: "testOutcome2"),
        ]
    }
}
