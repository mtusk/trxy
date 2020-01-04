//
//  ContentView.swift
//  trxy
//
//  Created by Adam Anderson on 1/1/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//    @ObservedObject var viewModel = ContentViewModel()
//
//    var body: some View {
//        NavigationView {
//            MasterView(testResults: $viewModel.testResults)
//            DetailView()
//        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
//    }
//}

//struct MasterView: View {
//    @Binding var testResults: [TestResult]
//
//    var body: some View {
//        List {
//            ForEach(testResults, id: \.self) { testResult in
//                NavigationLink(
//                    destination: DetailView(selectedTestResult: testResult)
//                ) {
//                    Text(testResult.name)
//                }
//            }.onDelete { indices in
//                indices.forEach { self.testResults.remove(at: $0) }
//            }
//        }
//    }
//}

//struct DetailView: View {
//    var selectedTestResult: TestResult?
//
//    var body: some View {
//        Group {
//            if selectedTestResult != nil {
//                Text(selectedTestResult!.name)
//            } else {
//                Text("Detail view content goes here")
//            }
//        }.navigationBarTitle(Text("Detail"))
//    }
//}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewLayout(.fixed(width: 800, height: 600))
//
//    }
//}
