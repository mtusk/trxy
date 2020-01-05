//
//  TestResultsDocument.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import UIKit
import SWXMLHash

class TestResultsDocument: UIDocument {
    
    // references:
    // - https://www.raywenderlich.com/1809473-uidocument-from-scratch
    // - https://www.techotopia.com/index.php/Managing_Files_using_the_iOS_8_UIDocument_Class
    
    var testResults: [TestResult] = [TestResult]()
    
    override var description: String {
      return fileURL.deletingPathExtension().lastPathComponent
    }
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        // (Use this to write the model into the document.)
        abort() // not implemented
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
        // (This is where you read the document and decode the model data.)
        
        var testResults: [TestResult] = [TestResult]()
        
        // read file text
        let text = try readFile(url: fileURL)
        
        // parse file text
        if (text != nil) {
            testResults = try parseTrx(xml: text!)
        }
        
        self.testResults = testResults
    }
    
    func readFile(url: URL) throws -> String? {
        let text = try String(contentsOf: url)
        
//        let bytes = (data as AnyObject).bytes!
//        let text = NSString(
//            bytes: bytes,
//            length: data.count,
//            encoding: String.Encoding.utf8.rawValue) as String?
        
        return text
    }
    
    func parseTrx(xml: String) throws -> [TestResult] {
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

