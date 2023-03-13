//
//  AppCore.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import Foundation

class AppCore {
    static let shared = AppCore()
    
    private init() {
        self.appDatabaseManager = AppDatabaseManager()
        self.appDeviceManager = AppDeviceManager()
        self.appStyleManager = AppStyleManager()
        self.appSpeechManager = AppSpeechManager()
    }
    
    func prepareSession() {
        appDatabaseManager.prepareSession() { _ in
            writeLog(type: .info, message: "Session prepared")
        }
    }
    func runSession() {
        appDatabaseManager.startSession()
    }
    func closeSession() {
        appDatabaseManager.closeSession()
    }
    
    private let appDatabaseManager: AppDatabaseManageable
    private let appDeviceManager: AppDeviceManageable
    private let appStyleManager: AppStyleManageable
    private let appSpeechManager: AppSpeechManageable
}

extension AppCore: AppCoreDeviceManageable {
    var deviceManager: AppDeviceManageable { return appDeviceManager }
}

extension AppCore: AppCoreDatabaseManageable {
    var databaseManager: AppDatabaseManageable { return appDatabaseManager }
}

extension AppCore: AppCoreStyleManageable {
    var styleManager: AppStyleManageable { return appStyleManager }
}

extension AppCore: AppCoreSpeechManageable {
    var speechManager: AppSpeechManageable { return appSpeechManager }
}
