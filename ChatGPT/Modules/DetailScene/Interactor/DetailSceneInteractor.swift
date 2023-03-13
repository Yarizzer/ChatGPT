//
//  DetailSceneInteractor.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class DetailSceneInteractor {
	init(withRouter router: DetailSceneRoutable, presenter: DetailScenePresentable, service: DetailSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private let router: DetailSceneRoutable
	private let presenter: DetailScenePresentable
	private let service: DetailSceneInteractorServiceType
}

extension DetailSceneInteractor: DetailSceneInteractable {
	func makeRequest(requestType: DetailSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup: presenter.response(responseType: .initialSetup)
        case .update(let request): service.update(with: request)
        case .dismiss:
            service.update(with: .stop)
            presenter.response(responseType: .releaseView)
            router.dismiss()
		}
	}
}
