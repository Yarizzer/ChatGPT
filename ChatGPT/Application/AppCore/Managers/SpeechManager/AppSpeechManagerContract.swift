//
//  AppSpeechManagerContract.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//

enum AppSpeechManagerActionType {
    case speak(with: String)
    case stop
    case pause
    case setVolume(withValue: Float)
    case setRate(withValue: Float)
    case setPitch(withValue: Float)
}
