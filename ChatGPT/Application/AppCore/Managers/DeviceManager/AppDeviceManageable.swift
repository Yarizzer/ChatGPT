//
//  AppDeviceManageable.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

protocol AppDeviceManageable {
    var screenSize: CGRect { get }
    var hasTopNotch: Bool { get }
    
    func generateSuccessFeedback()
    func generateFailureFeedback()
    func vibrate()
}
