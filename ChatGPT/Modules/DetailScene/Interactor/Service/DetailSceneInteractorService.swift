//
//  DetailSceneInteractorService.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailSceneInteractorServiceType{
	func updateVolume(with value: Float)
    func updatePitch(with value: Float)
    func updateRate(with value: Float)
    func startTalk()
    func silence()
}

class DetailSceneInteractorService {
	init(withModel model: DetailSceneViewModelType) {
		self.model = model
	}
	
	private var model: DetailSceneViewModelType
}

extension DetailSceneInteractorService: DetailSceneInteractorServiceType {
    func updateVolume(with value: Float) {
        model.updateVolume(with: value)
    }
    
    func updatePitch(with value: Float) {
        model.updatePitch(with: value)
    }
    
    func updateRate(with value: Float) {
        model.updateRate(with: value)
    }
    
    func startTalk() {
        model.startTalk()
    }
    
    func silence() {
        model.silence()
    }
}
