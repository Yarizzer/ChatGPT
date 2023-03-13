//
//  MessageEntity+CoreDataProperties.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//
//

import Foundation
import CoreData

extension MessageEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MessageEntity> {
        return NSFetchRequest<MessageEntity>(entityName: Constants.entityName)
    }

    @NSManaged public var uid: UUID
    @NSManaged public var senderName: String
    @NSManaged public var content: String
    @NSManaged public var timeStamp: Date
    @NSManaged public var incoming: Bool
}

extension MessageEntity : Identifiable {}

extension MessageEntity {
    private struct Constants {
        static let entityName = "MessageEntity"
    }
}
