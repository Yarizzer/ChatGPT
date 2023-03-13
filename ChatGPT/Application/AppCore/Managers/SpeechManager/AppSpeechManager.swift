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
        self.utterence = AVSpeechUtterance()
        
        utterence.voice = AVSpeechSynthesisVoice(language: Constants.voiceKey)
    }
    
    private let synth: AVSpeechSynthesizer
    private var utterence: AVSpeechUtterance
}

extension AppSpeechManager: AppSpeechManageable {
    func setRate(with value: Float) {
        //utterence.setRate(with: value)
    }
    
    func setVolume(with value: Float) {
        //utterence.volume.setVolume(with: value)
    }
    
    func setPitch(with multiplier: Float) {
        //utterence.setPitch(with: multiplier)
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
        static let voiceKey = "ru-RU"
    }
}
