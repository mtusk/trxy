//
//  TestResult.swift
//  trxy
//
//  Created by Adam Anderson on 1/1/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation
import SWXMLHash

struct TestResult : Decodable, Hashable, Identifiable {
    var guid: String
    var id: String
    var name: String
    var testClassName: String
    var outcome: String
}

class TestResultFactory {
    static func parseTrx(xml: String) throws -> [TestResult] {
        let xml = SWXMLHash.parse(xml)
        let unitTestResults = xml["TestRun"]["Results"]["UnitTestResult"]
        let unitTests = xml["TestRun"]["TestDefinitions"]["UnitTest"]
        
        var testResults = [TestResult]()
        for i in 0..<unitTestResults.all.count {
            
            let unitTestResult = unitTestResults[i]

            let guid = unitTestResult.element?.attribute(by: "testId")?.text ?? ""
            let outcome = unitTestResult.element?.attribute(by: "outcome")?.text ?? ""
            
            var name = ""
            var testClassName = ""
            var id = ""

            if guid != "" {
                let unitTest = try unitTests.withAttribute("id", guid)
                
                name = unitTest.element?.attribute(by: "name")?.text ?? ""
                testClassName = unitTest["TestMethod"].element?.attribute(by: "className")?.text ?? ""
                id = testClassName + name
            }
            
            let testResult = TestResult(
                guid: guid,
                id: id,
                name: name,
                testClassName: testClassName,
                outcome: outcome)

            testResults.append(testResult)
        }
        
        return testResults
    }
}
