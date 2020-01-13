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

struct SheetListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.testResults) { testResult in
                SheetListRowView(testResult: testResult)
            }
        }
    }
}

struct SheetListRowView: View {
    @State var testResult: TestResult
    @State var sheetPresented: Bool = false
    
    
    var body: some View {
        Button(action: {
            let userActivity = NSUserActivity(activityType: "panel")
            UIApplication.shared.requestSceneSessionActivation(nil, userActivity: userActivity, options: nil) { (error) in
                //?
            }
//            self.sheetPresented.toggle()
        }) {
            Text(testResult.name)
        }.sheet(isPresented: $sheetPresented) {
            SheetView(testResult: self.testResult)
        }
    }
}

struct SheetView: View {
    @State var testResult: TestResult
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back")
                }
                .padding()
                
                Text(testResult.name)
                    .lineLimit(1)
                
                Spacer()
            }
            
            Spacer()
            
            List {
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.headline)
                    Text(testResult.name)
                        .font(.subheadline)
                }
                VStack(alignment: .leading) {
                    Text("Class Name")
                        .font(.headline)
                    Text(testResult.testClassName)
                        .font(.subheadline)
                }
                HStack {
                    Text("Outcome")
                        .font(.headline)
                    Spacer()
                    Text(testResult.outcome)
                        .font(.subheadline)
                }
            }
            
            Spacer()
        }
        
    }
}







struct SheetListView_Preview: PreviewProvider {
    static var previews: some View {
        SheetListView(
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

struct SheetView_Preview: PreviewProvider {
    static var previews: some View {
        SheetView(
            testResult: TestResult(
                id: "1234-5678-9012",
                testId: "my really long test id that will wrap",
                name: "My Test Name",
                testClassName: "My Test Class Name",
                outcome: "Passed"))
    }
}
