//
//  DetailSceneViewModel.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailSceneViewModelType {
    var text: String { get }
    
    func updateVolume(with value: Float)
    func updatePitch(with value: Float)
    func updateRate(with value: Float)
}

class DetailSceneViewModel {
    init(with data: MessageModel) {
        self.data = data
    }
    
    private let data: MessageModel
}

extension DetailSceneViewModel: DetailSceneViewModelType {
    var text: String { return data.content }
    
    func updateVolume(with value: Float) {
        AppCore.shared.speechManager.setVolume(with: value)
    }
    
    func updatePitch(with value: Float) {
        AppCore.shared.speechManager.setPitch(with: value)
    }
    
    func updateRate(with value: Float) {
        AppCore.shared.speechManager.setRate(with: value)
    }
}
