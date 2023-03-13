//
//  MessageTableViewCellViewModel.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

protocol MessageTableViewCellViewModelType {
    var isReceived: Bool { get }
    var senderName: String { get }
    var uid: String { get }
    var content: String { get }
    var timeStamp: String { get }
}

class MessageTableViewCellViewModel {
    init(with model: MessageModel) {
        self.model = model
    }
    
    private var model: MessageModel
}

extension MessageTableViewCellViewModel: MessageTableViewCellViewModelType {
    var isReceived: Bool { return model.incoming }
    var senderName: String { return model.senderName }
    var uid: String { return model.uid.description }
    var content: String { return model.content }
    var timeStamp: String { return model.getTimeStampDesctiption() }
}
