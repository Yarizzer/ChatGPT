//
//  AppDeviceManageable.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

protocol AppDeviceManageable {
    var screenSize: CGRect { get }
    var topPaddingValue: CGFloat { get }
    var bottomPaddingValue: CGFloat { get }
    
    func generateSuccessFeedback()
    func generateFailureFeedback()
    func vibrate()
}
