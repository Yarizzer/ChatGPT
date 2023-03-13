//
//  AppDeviceManager.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit
import AVFoundation

class AppDeviceManager: AppDeviceManageable {
    var screenSize: CGRect { return UIScreen.main.bounds }
    
    var topPaddingValue: CGFloat {
        guard (UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0) > 24 else { return Constants.paddingValues.top.withoutNotch }
            
        return Constants.paddingValues.top.withNotch
    }
    
    var bottomPaddingValue: CGFloat {
        guard (UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.bottom ?? 0) > 0 else { return Constants.paddingValues.bottom.withoutNotch }
        
        return Constants.paddingValues.bottom.withNotch
    }
    
    func generateSuccessFeedback() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    func generateFailureFeedback() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
    
    func vibrate() {
        UIDevice.vibrate()
    }
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    }
}

extension AppDeviceManager {
    private struct Constants {
        static let paddingValues = (top : (withNotch: 44.0, withoutNotch: 24.0),
                                    bottom : (withNotch: 34.0, withoutNotch: 0.0))
    }
}

