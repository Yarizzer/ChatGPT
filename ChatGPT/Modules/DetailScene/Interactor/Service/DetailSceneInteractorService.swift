//
//  DetailSceneInteractorService.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailSceneInteractorServiceType{
	
}

class DetailSceneInteractorService {
	init(withModel model: DetailSceneViewModelType) {
		self.model = model
	}
	
	private var model: DetailSceneViewModelType
}

extension DetailSceneInteractorService: DetailSceneInteractorServiceType {
	
}
