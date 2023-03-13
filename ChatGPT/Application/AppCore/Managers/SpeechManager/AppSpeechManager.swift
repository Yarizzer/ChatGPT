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
        self.utterence = AVSpeechUtterance(string: Constants.initialDataValue)
        self.utterence.rate = Constants.initialRateValue
        self.utterence.voice = AVSpeechSynthesisVoice(language: Constants.voiceKey)
    }
    
    private let synth: AVSpeechSynthesizer
    private var utterence: AVSpeechUtterance
}

extension AppSpeechManager: AppSpeechManageable {
    func setRate(with value: Float) {
        utterence.rate = value
    }
    
    func setVolume(with value: Float) {
        utterence.volume = value
    }
    
    func setPitch(with multiplier: Float) {
        utterence.pitchMultiplier = multiplier
    }
    
    func speak(with data: String) {
        utterence = AVSpeechUtterance(string: data)
        synth.speak(utterence)
    }
    
    func pause() { synth.pauseSpeaking(at: .word) }
    func stop() { synth.stopSpeaking(at: .word) }
}

extension AppSpeechManager {
    private struct Constants {
        static let initialDataValue = ""
        static let initialRateValue: Float = 0.5
        static let voiceKey = "ru-RU"
    }
}
