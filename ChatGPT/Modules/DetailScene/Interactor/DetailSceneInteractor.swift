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

	private var router: DetailSceneRoutable
	private var presenter: DetailScenePresentable
	private var service: DetailSceneInteractorServiceType
}

extension DetailSceneInteractor: DetailSceneInteractable {
	func makeRequest(requestType: DetailSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup: presenter.response(responseType: .initialSetup)
        case .updateVolume(let value): service.updateVolume(with: value)
        case .updatePitch(let value): service.updatePitch(with: value)
        case .updateRate(let value): service.updateRate(with: value)
        case .dismiss:
            presenter.response(responseType: .releaseView)
            router.dismiss()
		}
	}
}
