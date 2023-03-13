//
//  AppDatabaseManager.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import Foundation

class AppDatabaseManager {
    init() {
        self.coreDataLayer = CoreDataLayer()
        self.chatGPTManager = AppChatGPTManager()
    }
    
    //MARK: - System
    func prepareSession(completion: @escaping(Bool) -> ()) {
        chatGPTManager.prepareSession() { [weak self] success in
            guard let sSelf = self else { return }
            
            if success {
                sSelf.coreDataLayer.messages.subscribe(sSelf) { [weak self] data in
                    self?.messages.value = data.newValue
                }
                sSelf.chatGPTManager.output.subscribe(sSelf) { [weak self] data in
                    guard let data = data.newValue, !data.isEmpty else { return }
                    
                    let model = MessageModel(with: data, for: .received)
                    self?.coreDataLayer.createMessage(with: model)
                }
            }
            
            completion(success)
        }
    }
    
    func startSession() {
        coreDataLayer.runSession()
    }
    
    func closeSession() {
        coreDataLayer.closeSession()
    }
    
    //MARK: - Layers
    private var coreDataLayer: CoreDataLayerType
    private var chatGPTManager: AppChatGPTManageable
    
    //MARK: - Publishers
    var messages: Publisher<[MessageModel]?> = Publisher(nil)
}

extension AppDatabaseManager: AppDatabaseManageable {
    func sendMessage(with model: MessageModel) {
        coreDataLayer.createMessage(with: model) { [weak self] success in
            if success {
                self?.chatGPTManager.sendMessage(with: model.content)
            }
        }
    }
    
    func clearChat() {
        coreDataLayer.clearChat()
    }
}
