//
//  MainSceneInteractorService.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneInteractorServiceType{
    func setupSubscription()
	func sendMessage(with content: String)
    func clearChat()
}

class MainSceneInteractorService {
    func setupSubscription() {
        model.setupSubscription()
    }
    
	init(withModel model: MainSceneViewModelType) {
		self.model = model
	}
	
	private var model: MainSceneViewModelType
}

extension MainSceneInteractorService: MainSceneInteractorServiceType {
    func sendMessage(with content: String) {
        model.sendMessage(with: content)
    }
    
    func clearChat() {
        model.clearChat()
    }
}
