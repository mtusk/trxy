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
                    ListRow(testResult: testResult)
                }
            }
        }
    }
}
