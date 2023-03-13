//
//  AppChatGPTManager.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import Foundation
import OpenAISwift

class AppChatGPTManager {
    func prepareSession(completion: @escaping (Bool) -> ()) {
        client = OpenAISwift(authToken: Constants.APIKey)
        completion(true)
    }
    
    private func clean(response: String?) -> String {
        return response?.replacingOccurrences(of: "\n\n", with: "") ?? ""
    }
    
    var output: Publisher<String?> = Publisher(nil)
    
    private var client: OpenAISwift?
}

extension AppChatGPTManager: AppChatGPTManageable {
    func sendMessage(with text: String) {
        client?.sendCompletion(with: text, maxTokens: Constants.maxTokensValue) { [weak self] result in
            switch result {
            case .success(let response):
                self?.output.value = self?.clean(response: response.choices.first?.text)
                
            case .failure(let error): writeLog(type: .error, message: "Failure to get response occurred. Description \(error.localizedDescription)")
            }
        }
    }
}

extension AppChatGPTManager {
    private struct Constants {
        static let APIKey = ""
        static let maxTokensValue = 1500
    }
}
