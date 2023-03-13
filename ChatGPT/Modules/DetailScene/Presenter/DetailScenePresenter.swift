//
//  DetailScenePresenter.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class DetailScenePresenter {
	init(for view: DetailSceneViewControllerType, service: DetailScenePresenterServiceType) {
		self.viewController = view
		self.service = service
	}
	
	private var viewController: DetailSceneViewControllerType?
	private let service: DetailScenePresenterServiceType
}

extension DetailScenePresenter: DetailScenePresentable {
	func response(responseType: DetailScenePresenterResponse.DetailSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
		case .releaseView: self.viewController = nil
		}
	}
}
