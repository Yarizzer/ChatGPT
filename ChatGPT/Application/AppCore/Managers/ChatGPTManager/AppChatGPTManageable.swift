//
//  AppChatGPTManageable.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

protocol AppChatGPTManageable {
    var output: Publisher<String?> { get }
    
    func prepareSession(completion: @escaping (Bool) -> ())
    func sendMessage(with text: String)
}
