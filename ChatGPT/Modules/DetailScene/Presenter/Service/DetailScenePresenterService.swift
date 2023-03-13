//
//  DetailScenePresenterService.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailScenePresenterServiceType{
	var model: DetailSceneViewModelType { get }
}

class DetailScenePresenterService {
	init(withModel model: DetailSceneViewModelType) {
		self.viewModel = model
	}
	
	private var viewModel: DetailSceneViewModelType
}

extension DetailScenePresenterService: DetailScenePresenterServiceType {
	var model: DetailSceneViewModelType { return viewModel }
}
