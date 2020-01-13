//
//  AppDelegate.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var application: UIApplication?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.application = application // TODO not sure if this is a terrible idea
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // This must be the entry point for the app?
        
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        
        // Note: Info.plit connects the "Default Configuration" scene to my SceneDelegate.swift class via $(PRODUCT_MODULE_NAME).SceneDelegate
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    @objc func openCommandClicked() {
        // TODO
        
        // maybe I can create a new scene? and since the default startup behavior of a scene should be to display a file picker it should work?
    }
    
    override func buildMenu(with builder: UIMenuBuilder) {
        // https://developer.apple.com/documentation/uikit/uicommand/adding_menus_and_shortcuts_to_the_menu_bar_and_user_interface
        // https://www.zachsim.one/blog/2019/8/4/customising-the-menu-bar-of-a-catalyst-app-using-uimenubuilder
        super.buildMenu(with: builder)
        
        builder.remove(menu: .services)
        builder.remove(menu: .format)
        builder.remove(menu: .toolbar)
        
        let openCommand = UIKeyCommand(
            title: NSLocalizedString("Open", comment: ""),
            image: nil,
            action: #selector(openCommandClicked),
//            action: #selector(MyViewController.myFunc(_:)), // References: https://developer.apple.com/videos/play/wwdc2019/235/ (~21:30)
            input: "O",
            modifierFlags: .command,
            propertyList: nil)

        let openMenu = UIMenu(
            title: "",
            image: nil,
            identifier: UIMenu.Identifier("com.mtusk.trxy.menus.openMenu"),
            options: .displayInline,
            children: [openCommand])

        builder.insertChild(openMenu, atStartOfMenu: .file)
    }
    
    // HOW THE HECK DOES ALL THIS WORK??
    // 
    // (app start with no input urls)
    // - AppDelegate::configurationForConnecting Tell the app to use scenes and to start with the "Default Confiugration" scene
    // - SceneDelegate::willConnectTo creates the DocumentBrowserViewController which will open a open file dialog
    // - When user picks a file from the open file dialog, DocumentBrowserViewController invokes present() which
    //   - I don't this is how it works... if you put breakpoints, you see that SceneDelegate::openURLContexts isn't called after selecting a file in the file dialog...
    // - DBVC creates the TestResultDocument which parses the file into TestResult objects
    // - DBVC spins up ListView for the TestResult objects
}

