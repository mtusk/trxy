//
//  AppDelegate.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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
    
    // HOW THE HECK DOES ALL THIS WORK??
    // 
    // (app start with no input urls)
    // - AppDelegate::configurationForConnecting Tell the app to use scenes and to start with the "Default Confiugration" scene
    // - SceneDelegate::willConnectTo creates the DocumentBrowserViewController which will open a open file dialog
    // - When user picks a file from the open file dialog, SceneDelegate::openURLContexts will tell the DBVC to reveal the document
    // - DBVC creates the TestResultDocument which parses the file into TestResult objects
    // - DBVC spins up ListView for the TestResult objects
}

