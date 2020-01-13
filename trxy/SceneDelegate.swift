//
//  SceneDelegate.swift
//  trxy
//
//  Created by Adam Anderson on 1/5/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import UIKit
import SwiftUI

let trxyOpenDetailActivityType       = "com.mtusk.trxy.openDetail"
let trxyOpenDetailPath               = "openDetail"
let trxyOpenDetailPhotoIdKey         = "photoId"

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? // TODO how does this work with multiple scenes? Is this not relevatn? Should I only access windows from the scene somehow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // References:
        // - https://developer.apple.com/documentation/uikit/app_and_environment/scenes/supporting_multiple_windows_on_ipad
        
        
        
        
        // I think this is the entry point for this scene
        // AppDelegate tells the app to use this scene
        
        // References:
        // - https://medium.com/@ZkHaider/apples-new-uiscene-api-a-programmatic-approach-52d05e382cf2
        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: windowScene)
        self.window = UIWindow(windowScene: windowScene)
        
        // TODO I might be able to do the UI customization here as well (titlebar, etc)
        // References:
        // - https://developer.apple.com/videos/play/wwdc2019/235/ (~17:00)
        #if targetEnvironment(macCatalyst)
        if let titlebar = windowScene.titlebar {
            let toolbar = NSToolbar(identifier: "1234")
            
            // TODO add outcome filters: only show failed tests, etc
            // TODO add search text box like the News app has
            // TODO add share sheet to export markdown or other formats? (file -> save menu, too?)
            
            titlebar.titleVisibility = .hidden
            
            // TODO add file name as title?
            titlebar.toolbar = toolbar
        }
        #endif
        
        // References:
        // - https://medium.com/@Dougly/a-uiviewcontroller-and-uiviews-without-storyboard-swift-3-543096e78f2
        // - https://medium.com/@ZkHaider/apples-new-uiscene-api-a-programmatic-approach-52d05e382cf2
        let documentBrowserViewController = DocumentBrowserViewController()
//        window.rootViewController = documentBrowserViewController
        self.window?.rootViewController = documentBrowserViewController
        
        // Present the window
//        window.makeKeyAndVisible()
        self.window?.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts urlContexts: Set<UIOpenURLContext>) {
        // "Asks the delegate to open one or more URLs"
        
        // References:
        // - https://stackoverflow.com/a/58625433/682803
        // - https://developer.apple.com/documentation/uikit/uiscenedelegate/3238059-scene
        
        // TODO open each url in urlContexts
        
//        if urlContexts.count <= 0 { return }
//
//        let urlContext = urlContexts.first! // TODO add support multiple urls
//        
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = windowScene.windows[0]
//        guard let documentBrowserViewController = window.rootViewController as? DocumentBrowserViewController else { return }
//
//        documentBrowserViewController.revealDocument(at: urlContext.url, importIfNeeded: true) { (revealedDocumentURL, error) in
//            if let error = error {
//                // Handle the error appropriately
//                print("Failed to reveal the document at URL \(urlContext.url) with error: '\(error)'")
//                return
//            }
//
//            // Present the Document View Controller for the revealed URL
//            documentBrowserViewController.presentDocument(at: revealedDocumentURL!)
//        }
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

