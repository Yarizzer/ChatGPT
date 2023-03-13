//
//  DetailSceneViewModelContract.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//

enum DetailSceneVMSpeechRequest {
    case startTalk
    case stop
    case pause
    case updateVolume(with: Float)
    case updatePitch(with: Float)
    case updateRate(with: Float)
}
