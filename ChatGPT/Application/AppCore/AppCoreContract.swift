//
//  AppCoreContract.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

protocol AppCoreStyleManageable {
    var styleManager: AppStyleManageable { get }
}

protocol AppCoreDeviceManageable {
    var deviceManager: AppDeviceManageable { get }
}

protocol AppCoreDatabaseManageable {
    var databaseManager: AppDatabaseManageable { get }
}

protocol AppCoreSpeechManageable {
    var speechManager: AppSpeechManageable { get }
}
