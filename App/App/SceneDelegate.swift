//
//  SceneDelegate.swift
//  App
//
//  Created by 築山朋紀 on 2020/07/16.
//  Copyright © 2020 築山朋紀. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if isTesting {
            return
        }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = .init(windowScene: windowScene)
        let dependency = RootViewController.Dependency(
            rootViewController: .init())
        window?.rootViewController = RootViewController(dependency: dependency)
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    var isTesting: Bool {
        ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
}
