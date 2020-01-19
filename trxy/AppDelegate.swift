//
//  AppDelegate.swift
//  trxy
//
//  Created by Adam Anderson on 1/17/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var documentController: NSDocumentController?

    // references:
    // https://www.swiftdevjournal.com/create-a-document-based-mac-app-in-swift/
    // https://talk.objc.io/episodes/S01E145-setting-up-a-document-based-app       https://github.com/objcio/S01E145-setting-up-a-document-based-app
    // https://www.raywenderlich.com/613-windows-and-windowcontroller-tutorial-for-macos
    // http://www.arp.com/medias/13902069.pdf (Document-Based App Programming Guide for Mac)
    // https://developer.apple.com/documentation/appkit/documents_files_and_icloud/developing_a_document-based_app

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationWillFinishLaunching(_ notification: Notification) {
        /*
         Document-Based App Programming Guide for Mac:
         There are two ways to subclass NSDocumentController:
         - You can make an instance of your subclass in your app’s main nib file. This instance becomes the shared instance.
         - You can create an instance of yoursubclassin your app delegate’s applicationWillFinishLaunching:
         
         The first NSDocumentController object to be created becomes the shared instance. The AppKit framework
         creates the shared instance (using the NSDocumentController class) during the “finish launching” phase of
         app startup. So if you need a subclass instance, you must create it before AppKit does.
         */
//        documentController = NSDocumentController()
    }
    
    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        /*
         Document-Based App Programming Guide for Mac:
         Note: If you don’t want to open an untitled document when the app is launched or activated,
         implement the app delegate method applicationShouldOpenUntitledFile: to return NO. If
         you do want to open an untitled document when launched, but don't want to open an untitled
         document when the app is already running and activated from the dock, you can instead implement
         the delegate’s applicationShouldHandleReopen:hasVisibleWindows: method to return NO
         */
        return false
    }
}

