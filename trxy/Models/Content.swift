//
//  Content.swift
//  trxy
//
//  Created by Adam Anderson on 1/17/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation
import Cocoa
import SWXMLHash

class Content: NSObject {
    @objc dynamic var testResults = [TestResult]()
    
    public init(testResults: [TestResult]) {
        self.testResults = testResults
    }
}

extension Content {
    
    func read(from data: Data) {
        var testResults: [TestResult] = [TestResult]()
        
        if let xml = String(bytes: data, encoding: .utf8) {
            do {
                testResults = try self.parseTrx(xml: xml)
            } catch {
                print("ruh roh")
            }
        }

        self.testResults = testResults
    }
    
    func parseTrx(xml: String) throws -> [TestResult] {
        let xml = SWXMLHash.parse(xml)
        let unitTestResults = xml["TestRun"]["Results"]["UnitTestResult"]
        let unitTests = xml["TestRun"]["TestDefinitions"]["UnitTest"]
        
        var testResults = [TestResult]()
        for i in 0..<unitTestResults.all.count {
            
            let unitTestResult = unitTestResults[i]

            let id = unitTestResult.element?.attribute(by: "testId")?.text ?? ""
            let outcome = unitTestResult.element?.attribute(by: "outcome")?.text ?? ""
            
            var name = ""
            var testClassName = ""
            var testId = ""

            if id != "" {
                let unitTest = try unitTests.withAttribute("id", id)
                
                name = unitTest.element?.attribute(by: "name")?.text ?? ""
                testClassName = unitTest["TestMethod"].element?.attribute(by: "className")?.text ?? ""
                testId = testClassName + name
            }
            
            let testResult = TestResult(
                id: id,
                testId: testId,
                name: name,
                testClassName: testClassName,
                outcome: outcome)

            testResults.append(testResult)
        }
        
        return testResults
    }
}
