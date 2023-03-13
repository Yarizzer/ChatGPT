//
//  AppRouter.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

protocol AppRouterable {
    func routeToInitialScene()
}

class AppRouter {
    init() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .systemBackground
        self.window = window
    }
    
    private var window: UIWindow
}

extension AppRouter: AppRouterable {
    func routeToInitialScene() {
        window.rootViewController = InitialSceneRouter.assembly()
        window.makeKeyAndVisible()
    }
}
