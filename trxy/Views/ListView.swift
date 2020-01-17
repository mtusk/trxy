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

//struct MyNavigationViewController: UIViewControllerRepresentable { // reference: https://goshdarnswiftui.com/#uiviewrepresentable
//    var controllers: [UIViewController]
//
//    func makeUIViewController(context: Context) -> UINavigationController {
//        let navigationViewController = UINavigationController()
//
//        return navigationViewController
//    }
//
//    func updateUIViewController(_ navigationViewController: UINavigationController, context: Context) {
//        navigationViewController.setViewControllers(
//            [controllers[0]], animated: true)
//    }
//}

//struct MyNavigationConfigurator: UIViewControllerRepresentable { // reference: https://stackoverflow.com/a/58427754/682803
//    var configure: (UINavigationController) -> Void = { _ in }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<MyNavigationConfigurator>) -> UIViewController {
//        UIViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MyNavigationConfigurator>) {
//        if let navigationController = uiViewController.navigationController {
//            self.configure(navigationController)
//        }
//    }
//}

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("sup")) {
                Text("Click me")
            }
//        MyNavigationView {
//            List {
//                ForEach(self.viewModel.testResults) { testResult in
//                    NavigationLink(destination: DetailView(viewModel: .init(testResult: testResult))) {
//                        Text(testResult.name)
//                    }
//                }
//            }
//            .listStyle(.sidebar)
//            .listStyle(SidebarListStyle())
//            .navigationBarTitle(self.viewModel.fileName)
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
