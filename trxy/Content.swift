//
//  Content.swift
//  trxy
//
//  Created by Adam Anderson on 1/17/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation
import Cocoa

class Content: NSObject {
    @objc dynamic var contentString = ""
    
    public init(contentString: String) {
        self.contentString = contentString
    }
    
}

extension Content {
    
    func read(from data: Data) {
        contentString = String(bytes: data, encoding: .utf8)!
    }
    
    func data() -> Data? {
        return contentString.data(using: .utf8)
    }
    
}
