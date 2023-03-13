//
//  MainSceneInteractor.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class MainSceneInteractor {
	init(withRouter router: MainSceneRoutable, presenter: MainScenePresentable, service: MainSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private var router: MainSceneRoutable
	private var presenter: MainScenePresentable
	private var service: MainSceneInteractorServiceType
}

extension MainSceneInteractor: MainSceneInteractable {
	func makeRequest(requestType: MainSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup:
            service.setupSubscription()
            presenter.response(responseType: .initialSetup)
        case .sendMessage(let content):
            service.sendMessage(with: content)
            presenter.response(responseType: .setViewToInitialState)
        case .clearChat: service.clearChat()
		}
	}
}
