//
//  SceneDelegate.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? // TODO how does this work with multiple scenes? Is this not relevatn? Should I only access windows from the scene somehow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // I think this is the entry point for this scene
        // AppDelegate tells the app to use this scene
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            // TODO I might be able to do the UI customization here as well (titlebar, etc)
            
            // References:
            // - https://medium.com/@Dougly/a-uiviewcontroller-and-uiviews-without-storyboard-swift-3-543096e78f2
            let documentBrowserViewController = DocumentBrowserViewController()
            window.rootViewController = documentBrowserViewController
            
            self.window = window // TODO should this window be given to the scene somehow?
            
            // Present the window
            window.makeKeyAndVisible()
        }
    }
    
    func scene(_ scene: UIScene, openURLContexts urlContexts: Set<UIOpenURLContext>) {
        // "Asks the delegate to open one or more URLs"
        
        // References:
        // - https://stackoverflow.com/a/58625433/682803
        // - https://developer.apple.com/documentation/uikit/uiscenedelegate/3238059-scene
        
        // I bet:
        //   open file from Finder, etc -> trxy -> this method
        //   open trxy -> open file dialog appears -> user selects file -> this method
        
        // TODO open each url in urlContexts
        // TODO I think this is where I should set up the document browser view controller and attach it to the scene similar to how it hooked into window
        
        if urlContexts.count <= 0 { return }
        
        let urlContext = urlContexts.first! // TODO add support multiple urls
        
        guard let documentBrowserViewController = window?.rootViewController as? DocumentBrowserViewController else { return }
        
        documentBrowserViewController.revealDocument(at: urlContext.url, importIfNeeded: true) { (revealedDocumentURL, error) in
            if let error = error {
                // Handle the error appropriately
                print("Failed to reveal the document at URL \(urlContext.url) with error: '\(error)'")
                return
            }
            
            // Present the Document View Controller for the revealed URL
            documentBrowserViewController.presentDocument(at: revealedDocumentURL!)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

