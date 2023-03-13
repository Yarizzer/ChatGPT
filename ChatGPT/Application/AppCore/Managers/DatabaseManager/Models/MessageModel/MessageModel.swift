//
//  MessageModel.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import Foundation

enum MessageType {
    case sent, received
}

struct MessageModel {
    //MARK: - Init's
    init(with content: String, for type: MessageType) {
        self.uid        = UUID()
        self.content    = content
        self.timeStamp  = Date()
        
        switch type {
        case .received:
            self.incoming   = true
            self.senderName = Constants.botNamePlaceholder
        case .sent:
            self.incoming   = false
            self.senderName = Constants.ownerNamePlaceholder
        }
    }
    
    init(with cdEntity: MessageEntity) {
        self.uid        = cdEntity.uid
        self.senderName = cdEntity.senderName
        self.timeStamp  = cdEntity.timeStamp
        self.content    = cdEntity.content
        self.incoming   = cdEntity.incoming
    }
    
    func getTimeStampDesctiption() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        dateFormatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: timeStamp)
    }
    
    var uid: UUID
    var senderName: String
    var timeStamp: Date
    var content: String
    var incoming: Bool
}

extension MessageModel {
    private struct Constants {
        static let ownerNamePlaceholder = "Me"
        static let botNamePlaceholder = "ChatGPT engine"
        static let dateFormat = "dd/MM/yyyy"
    }
}
