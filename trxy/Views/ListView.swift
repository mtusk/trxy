//
//  ListView.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation
import SwiftUI

// followed this example:
// https://github.com/kitasuke/SwiftUI-MVVM/blob/master/SwiftUI-MVVM/Views/RepositoryListView.swift

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.testResults) { testResult in
                    NavigationLink(destination: DetailView(viewModel: .init(testResult: testResult))) {
                        Text(testResult.name)
                    }
                }
            }
            .navigationBarTitle(viewModel.fileName)
//            .navigationViewStyle(DoubleColumnNavigationViewStyle()) // reference: https://stackoverflow.com/a/57215664/682803
        }
    }
}

struct ListView_Preview: PreviewProvider {
    static var previews: some View {
        ListView(
            viewModel: ListViewModel(
                fileName: "my-file-name.trx",
                testResults: [
                    TestResult(
                        id: "1234-5678-9012",
                        testId: "my really long test id that will wrap 1",
                        name: "My Test Name 1",
                        testClassName: "My Test Class Name",
                        outcome: "Passed"),
                    TestResult(
                        id: "2345-5678-9012",
                        testId: "my really long test id that will wrap 2",
                        name: "My Test Name 2",
                        testClassName: "My Test Class Name",
                        outcome: "Passed"),
                    TestResult(
                        id: "3456-5678-9012",
                        testId: "my really long test id that will wrap 3",
                        name: "My Test Name 3",
                        testClassName: "My Test Class Name",
                        outcome: "Passed")
                ]))
    }
}
