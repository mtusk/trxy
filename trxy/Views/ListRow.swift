//
//  ListRow.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation
import SwiftUI

struct ListRow: View {
    @State var testResult: TestResult

    var body: some View {
        NavigationLink(destination: DetailView(viewModel: .init(testResult: testResult))) {
            Text(testResult.name)
        }
    }
}
