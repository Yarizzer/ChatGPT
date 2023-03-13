//
//  AppDatabaseManageable.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

protocol AppDatabaseManageable {
    //MARK: - System
    func prepareSession(completion: @escaping (Bool) -> ())
    func startSession()
    func closeSession()
    
    //MARK: - Publishers
    var messages: Publisher<[MessageModel]?> { get }
    
    func sendMessage(with model: MessageModel)
    func clearChat()
}
