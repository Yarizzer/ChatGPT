//
//  DetailSceneViewModel.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailSceneViewModelType {
    var text: String { get }
    
    func update(with type: DetailSceneVMSpeechRequest)
}

class DetailSceneViewModel {
    init(with data: MessageModel) {
        self.data = data
    }
    
    private let data: MessageModel
}

extension DetailSceneViewModel: DetailSceneViewModelType {
    var text: String { return data.content }
    
    func update(with type: DetailSceneVMSpeechRequest) {
        switch type {
        case .startTalk: AppCore.shared.speechManager.invoke(action: .speak(with: data.content))
        case .stop: AppCore.shared.speechManager.invoke(action: .stop)
        case .pause: AppCore.shared.speechManager.invoke(action: .pause)
        case .updateVolume(let volume): AppCore.shared.speechManager.invoke(action: .setVolume(withValue: volume))
        case .updateRate(let rate): AppCore.shared.speechManager.invoke(action: .setRate(withValue: rate))
        case .updatePitch(let pitch): AppCore.shared.speechManager.invoke(action: .setPitch(withValue: pitch))
        }
    }
}
