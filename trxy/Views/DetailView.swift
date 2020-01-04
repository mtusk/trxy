//
//  DetailView.swift
//  trxy
//
//  Created by Adam Anderson on 1/3/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            Text("id: " + viewModel.testResult.id)
            Text("outcome: " + viewModel.testResult.outcome)
            Spacer()
        }
    }
}
