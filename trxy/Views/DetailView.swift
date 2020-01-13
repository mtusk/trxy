//
//  DetailView.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        List {
            HStack {
                Text("Id")
                    .font(.headline)
                Spacer()
                Text(viewModel.testResult.testId)
                    .font(.subheadline)
            }
            HStack {
                Text("Class Name")
                    .font(.headline)
                Spacer()
                Text(viewModel.testResult.testClassName)
                    .font(.subheadline)
            }
            VStack(alignment: .leading) {
                Text("Outcome")
                    .font(.headline)
                Text(viewModel.testResult.outcome)
                    .font(.subheadline)
            }
            HStack {
                Text("Outcome")
                    .font(.headline)
                Spacer()
                Text(viewModel.testResult.outcome)
                    .font(.subheadline)
            }
        }
    }
}

struct DetailView_Preview: PreviewProvider {
    static var previews: some View {
        DetailView(
            viewModel: .init(
                testResult: TestResult(
                    id: "1234-5678-9012",
                    testId: "my really long test id that will wrap",
                    name: "My Test Name",
                    testClassName: "My Test Class Name",
                    outcome: "Passed")))
    }
}
