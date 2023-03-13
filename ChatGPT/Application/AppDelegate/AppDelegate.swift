//
//  AppDelegate.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var router: AppRouterable?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        router = AppRouter()
        
        AppCore.shared.prepareSession()
        
        routeToInitialScene()
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        AppCore.shared.runSession()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        AppCore.shared.closeSession()
    }
    
    private func routeToInitialScene() {
        self.router?.routeToInitialScene()
    }
}
