//
//  DetailSceneInteractorService.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailSceneInteractorServiceType{
    func update(with type: DetailSceneVMSpeechRequest)
}

class DetailSceneInteractorService {
	init(withModel model: DetailSceneViewModelType) {
		self.model = model
	}
	
	private let model: DetailSceneViewModelType
}

extension DetailSceneInteractorService: DetailSceneInteractorServiceType {
    func update(with type: DetailSceneVMSpeechRequest) {
        model.update(with: type)
    }
}
