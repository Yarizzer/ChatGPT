//
//  ReceivedMessageTableViewCell.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

class ReceivedMessageTableViewCell: UITableViewCell {
    func setup(with model: MessageTableViewCellViewModelType) {
        self.viewModel = model
        
        self.senderName.text = model.senderName
        self.uid.text = model.uid
        self.contentTV.text = model.content
        self.timeStamp.text = model.timeStamp
        
        self.setupView()
    }
    
    private func setupView() {
        self.backgroundColor = AppCore.shared.styleManager.colorClear
        
        contentTV.backgroundColor = AppCore.shared.styleManager.colorWhite
        contentTV.layer.cornerRadius = Constants.cornerRadiusValue
        contentTV.layer.masksToBounds = true
        
        senderInfo.backgroundColor = AppCore.shared.styleManager.colorWhite
        senderInfo.layer.cornerRadius = Constants.cornerRadiusValue
        senderInfo.layer.masksToBounds = true
        
        senderName.textColor = AppCore.shared.styleManager.colorDarkGray
        senderName.font = AppCore.shared.styleManager.labelTitleFontLarge
        senderName.minimumScaleFactor = Constants.minScaleFactor
        senderName.adjustsFontSizeToFitWidth = true
        
        uid.textColor = AppCore.shared.styleManager.colorDarkGray
        uid.font = AppCore.shared.styleManager.labelTitleFontExtraSmall
        uid.minimumScaleFactor = Constants.minScaleFactor
        uid.adjustsFontSizeToFitWidth = true
        
        timeStamp.textColor = AppCore.shared.styleManager.colorDarkGray
        timeStamp.font = AppCore.shared.styleManager.labelTitleFontExtraSmall
        timeStamp.minimumScaleFactor = Constants.minScaleFactor
        timeStamp.adjustsFontSizeToFitWidth = true
        
        contentTV.textColor = AppCore.shared.styleManager.colorDarkGray
        contentTV.font = AppCore.shared.styleManager.labelTitleFontMedium
    }
    
    private var viewModel: MessageTableViewCellViewModelType?
    
    @IBOutlet private weak var senderInfo: UIView!
    @IBOutlet private weak var canvasView: UIView!
    @IBOutlet private weak var senderName: UILabel!
    @IBOutlet private weak var uid: UILabel!
    @IBOutlet private weak var contentTV: UITextView!
    @IBOutlet private weak var timeStamp: UILabel!
}

extension ReceivedMessageTableViewCell: NibLoadableView {}

extension ReceivedMessageTableViewCell {
    private struct Constants {
        static let cornerRadiusValue: CGFloat = 10
        static let minScaleFactor: CGFloat = 0.5
    }
}
