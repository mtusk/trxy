//
//  TestResult.swift
//  trxy
//
//  Created by Adam Anderson on 1/19/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation

//@objc(TestResult)
class TestResult : NSObject {
    @objc dynamic var id: String
    @objc dynamic var testId: String
    @objc dynamic var name: String
    @objc dynamic var testClassName: String
    @objc dynamic var outcome: String
    
    override init() {
        self.id = ""
        self.testId = ""
        self.name = ""
        self.testClassName = ""
        self.outcome = ""
    }
    
    init(
        id: String,
        testId: String,
        name: String,
        testClassName: String,
        outcome: String
    ) {
        self.id = id
        self.testId = testId
        self.name = name
        self.testClassName = testClassName
        self.outcome = outcome
    }
}
