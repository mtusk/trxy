//
//  DocumentBrowserViewController.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import UIKit
import SwiftUI

class DocumentBrowserViewController: UIDocumentBrowserViewController, UIDocumentBrowserViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        allowsPickingMultipleItems = false
        
        // Update the style of the UIDocumentBrowserViewController
        // browserUserInterfaceStyle = .dark
        // view.tintColor = .white
        
        // Specify the allowed content types of your application via the Info.plist.
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: UIDocumentBrowserViewControllerDelegate
    
//    func documentBrowser(_ controller: UIDocumentBrowserViewController, didRequestDocumentCreationWithHandler importHandler: @escaping (URL?, UIDocumentBrowserViewController.ImportMode) -> Void) {
//        let newDocumentURL: URL? = nil
//
//        // Set the URL for the new document here. Optionally, you can present a template chooser before calling the importHandler.
//        // Make sure the importHandler is always called, even if the user cancels the creation request.
//        if newDocumentURL != nil {
//            importHandler(newDocumentURL, .move)
//        } else {
//            importHandler(nil, .none)
//        }
//    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didPickDocumentsAt documentURLs: [URL]) {
        guard let sourceURL = documentURLs.first else { return }
        
        // Present the Document View Controller for the first document that was picked.
        // If you support picking multiple items, make sure you handle them all.
        presentDocument(at: sourceURL)
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didImportDocumentAt sourceURL: URL, toDestinationURL destinationURL: URL) {
        // Present the Document View Controller for the new newly created document
        presentDocument(at: destinationURL)
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, failedToImportDocumentAt documentURL: URL, error: Error?) {
        // TODO: Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
    }
    
    // MARK: Document Presentation
    
    func presentDocument(at documentURL: URL) {
        let document = TestResultsDocument(fileURL: documentURL)

        // Access the document
        document.open(completionHandler: { success in
            if success {
                // Display the content of the document:
                
                let view = ListView(viewModel: .init(testResults: document.testResults))
                let documentViewController = UIHostingController(rootView: view)
                
                self.present(documentViewController, animated: true, completion: nil)
            } else {
                // TODO: Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }

    func closeDocument(_ document: TestResultsDocument) {
        dismiss(animated: true) {
            document.close(completionHandler: nil)
        }
    }
}

