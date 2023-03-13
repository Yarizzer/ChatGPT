//
//  AppSpeechManager.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//

import Speech

class AppSpeechManager {
    init() {
        self.synth = AVSpeechSynthesizer()
        self.utterance = AVSpeechUtterance()
        
        utterance.voice = AVSpeechSynthesisVoice(language: Constants.voiceKey)
    }
    
    private let synth: AVSpeechSynthesizer
    private var utterance: AVSpeechUtterance
}

extension AppSpeechManager: AppSpeechManageable {
    func invoke(action: AppSpeechManagerActionType) {
        switch action {
        case .speak(let data):
            utterance = AVSpeechUtterance(string: data)
            synth.speak(utterance)
        case .stop: synth.stopSpeaking(at: .word)
        case .pause: synth.pauseSpeaking(at: .word)
        case .setVolume(let value): utterance.volume = value
        case .setPitch(let value): utterance.pitchMultiplier = value
        case .setRate(let value): utterance.rate = value
        }
    }
}

extension AppSpeechManager {
    private struct Constants {
        static let voiceKey = "ru-RU"
    }
}
