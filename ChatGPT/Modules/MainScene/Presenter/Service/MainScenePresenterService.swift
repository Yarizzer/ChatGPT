//
//  MainScenePresenterService.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainScenePresenterServiceType{
	var model: MainSceneViewModelType { get }
}

class MainScenePresenterService {
	init(withModel model: MainSceneViewModelType) {
		self.viewModel = model
	}
	
	private var viewModel: MainSceneViewModelType
}

extension MainScenePresenterService: MainScenePresenterServiceType {
	var model: MainSceneViewModelType { return viewModel }
}
