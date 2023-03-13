//
//  AppStyleManager.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

class AppStyleManager {
    //MARK: - Style
    private enum StyleColors {
        case clear
        case white
        case black
        case lightGray
        case gray
        case darkGray
        case red
        case softGreen
        case green
        case softYellow
        case softBlue
        case blue
        case softPurple
        case purple
        
        var color: UIColor {
            switch self {
            case .clear:        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            case .white:        return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            case .black:        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case .lightGray:    return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)        // hex: CDCDCD
            case .gray:         return #colorLiteral(red: 0.5450980392, green: 0.5450980392, blue: 0.5450980392, alpha: 1)        // hex: 8B8B8B
            case .darkGray:     return #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.2352941176, alpha: 1)        // hex: 3C3C3C
            case .red:          return #colorLiteral(red: 1, green: 0.3137254902, blue: 0, alpha: 1)        // hex: FF5000
            case .softGreen:    return #colorLiteral(red: 0.7254901961, green: 0.8196078431, blue: 0.6509803922, alpha: 1)        // hex: B9D1A6
            case .green:        return #colorLiteral(red: 0, green: 0.6666666667, blue: 0.3137254902, alpha: 1)        // hex: 00AA50
            case .softYellow:   return #colorLiteral(red: 0.9607843137, green: 0.9411764706, blue: 0.6, alpha: 1)        // hex: F5F099
            case .softBlue:     return #colorLiteral(red: 0.007843137255, green: 0.9882352941, blue: 0.9843137255, alpha: 1)        // hex: 02FCFB
            case .blue:         return #colorLiteral(red: 0.05490196078, green: 0.4823529412, blue: 0.9843137255, alpha: 1)        // hex: 0E7BFB
            case .softPurple:   return #colorLiteral(red: 0.5450980392, green: 0.5568627451, blue: 1, alpha: 1)        // hex: 8B8EFF
            case .purple:       return #colorLiteral(red: 0.5450980392, green: 0, blue: 1, alpha: 1)        // hex: 8B00FF
            }
        }
    }
}

extension AppStyleManager: AppStyleManageable {
    //Colors
    var colorClear: UIColor { return StyleColors.clear.color }
    var colorWhite: UIColor { return StyleColors.white.color }
    var colorBlack: UIColor { return StyleColors.black.color }
    var colorLightGray: UIColor { return StyleColors.lightGray.color }
    var colorGray: UIColor { return StyleColors.gray.color }
    var colorDarkGray: UIColor { return StyleColors.darkGray.color }
    var colorRed: UIColor { return StyleColors.red.color }
    var colorSoftGreen: UIColor { return StyleColors.softGreen.color }
    var colorGreen: UIColor { return StyleColors.green.color }
    var colorSoftYellow: UIColor { return StyleColors.softYellow.color }
    var colorSoftBlue: UIColor { return StyleColors.softBlue.color }
    var colorBlue: UIColor { return StyleColors.blue.color }
    var colorSoftPurple: UIColor { return StyleColors.softPurple.color }
    var colorPurple: UIColor { return StyleColors.purple.color }
    //Fonts
    var labelTitleFontExtraLarge: UIFont { return UIFont(name: Constants.mainAppFontName, size: Constants.extraLargeFontValue)! }
    var labelTitleFontLarge: UIFont { return UIFont(name: Constants.mainAppFontName, size: Constants.largeFontValue)! }
    var labelTitleFontMedium: UIFont { return UIFont(name: Constants.mainAppFontName, size: Constants.mediumFontValue)! }
    var labelTitleFontSmall: UIFont { return UIFont(name: Constants.mainAppFontName, size: Constants.smallFontValue)! }
    var labelTitleFontExtraSmall: UIFont { return UIFont(name: Constants.mainAppFontName, size: Constants.extraSmallFontValue)! }
    //Layers
    var layerRegularBorderWidth: CGFloat { return Constants.regularBorderWidthValue}
    var layerRegularLineWidth: CGFloat { return Constants.regularLineWidthValue }
}

extension AppStyleManager {
    private struct Constants {
        static let mainAppFontName = "AppleSDGothicNeo-UltraLight"
        static let extraLargeFontValue: CGFloat = 22
        static let largeFontValue: CGFloat = 20
        static let mediumFontValue: CGFloat = 17
        static let smallFontValue: CGFloat = 14
        static let extraSmallFontValue: CGFloat = 12
        static let regularBorderWidthValue: CGFloat = 1.0
        static let regularLineWidthValue: CGFloat = 2.0
    }
}
