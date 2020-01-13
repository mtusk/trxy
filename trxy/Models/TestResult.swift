//
//  TestResult.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation

struct TestResult : Decodable, Hashable, Identifiable {
    var id: String
    var testId: String
    var name: String
    var testClassName: String
    var outcome: String
}
