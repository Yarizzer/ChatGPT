//
//  MainScenePresenter.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class MainScenePresenter {
	init(for view: MainSceneViewControllerType, service: MainScenePresenterServiceType) {
		self.viewController = view
		self.service = service
        
        service.model.shouldUpdateData.subscribe(self) { [weak self] data in
            self?.viewController?.update(viewModelDataType: .reloadProviderData(with: service.model))
        }
	}
	
	private var viewController: MainSceneViewControllerType?
	private var service: MainScenePresenterServiceType
}

extension MainScenePresenter: MainScenePresentable {
	func response(responseType: MainScenePresenterResponse.MainSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup:
            viewController?.update(viewModelDataType: .initialSetup(with: model))
            viewController?.update(viewModelDataType: .setupProvider(with: model))
        case .setViewToInitialState: viewController?.update(viewModelDataType: .setViewToInitialState)
		case .releaseView: viewController = nil
		}
	}
}
