//
//  SentMessageTableViewCell.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

class SentMessageTableViewCell: UITableViewCell {
    func setup(with model: MessageTableViewCellViewModelType) {
        self.viewModel = model
        
        self.senderName.text = model.senderName
        self.uid.text = model.uid
        self.content.text = model.content
        self.timeStamp.text = model.timeStamp
        
        self.setupView()
    }
    
    private func setupView() {
        self.backgroundColor = AppCore.shared.styleManager.colorClear
        
        content.backgroundColor = AppCore.shared.styleManager.colorSoftGreen
        content.layer.cornerRadius = Constants.cornerRadiusValue
        content.layer.masksToBounds = true
        
        senderInfo.backgroundColor = AppCore.shared.styleManager.colorSoftGreen
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
        
        content.textColor = AppCore.shared.styleManager.colorDarkGray
        content.font = AppCore.shared.styleManager.labelTitleFontMedium
    }
    
    private var viewModel: MessageTableViewCellViewModelType?
    
    @IBOutlet private weak var senderInfo: UIView!
    @IBOutlet private weak var canvasView: UIView!
    @IBOutlet private weak var senderName: UILabel!
    @IBOutlet private weak var uid: UILabel!
    @IBOutlet private weak var content: UILabel!
    @IBOutlet private weak var timeStamp: UILabel!
}

extension SentMessageTableViewCell: NibLoadableView {}

extension SentMessageTableViewCell {
    private struct Constants {
        static let cornerRadiusValue: CGFloat = 10
        static let minScaleFactor: CGFloat = 0.5
    }
}
