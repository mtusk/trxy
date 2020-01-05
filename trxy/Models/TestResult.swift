//
//  TestResult.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
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
