//
//  AppSpeechManageable.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//

protocol AppSpeechManageable {
    func setRate(with value: Float)
    func setVolume(with value: Float)
    func setPitch(with multiplier: Float)
    
    func speak(with data: String)
    func pause()
    func stop()
}
