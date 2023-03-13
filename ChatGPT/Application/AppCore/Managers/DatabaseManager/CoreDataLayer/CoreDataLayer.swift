//
//  CoreDataLayer.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import CoreData

class CoreDataLayer {
    init() {
        self.container = NSPersistentContainer(name: Constants.containerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        self.context = container.viewContext
    }
    
    //MARK: - Context
    private func saveContext() {
        do {
            try context.save()
        } catch {
            writeLog(type: .coreDataError, message: error.localizedDescription)
        }
    }
    
    func runSession() {
        let fetchRequest: NSFetchRequest<MessageEntity> = MessageEntity.fetchRequest()
            
        var value = [MessageModel]()
        do {
            try context.fetch(fetchRequest).forEach { entity in
                value.append(MessageModel(with: entity))
            }
        } catch {
            writeLog(type: .coreDataError, message: error.localizedDescription)
        }
        
        messages.value = value
    }
    
    func closeSession() {
        messages.value?.removeAll()
    }
    
    private func createNewMessage(with data: MessageModel) {
        guard let entity = NSEntityDescription.entity(forEntityName: Constants.messageEntityName, in: context),
              let entityObject = NSManagedObject(entity: entity, insertInto: context) as? MessageEntity else { return }

        entityObject.uid = data.uid
        entityObject.senderName = data.senderName
        entityObject.timeStamp = Date()
        entityObject.content = data.content
        entityObject.incoming = data.incoming
        
        saveContext()
        messages.value?.append(data)
    }
    
    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext
    
    //Publishers
    var messages: Publisher<[MessageModel]?> = Publisher(nil)
}

extension CoreDataLayer: CoreDataLayerType {
    func createMessage(with data: MessageModel) {
        createNewMessage(with: data)
    }
    
    func createMessage(with data: MessageModel, completion: @escaping(Bool) -> ()) {
        createNewMessage(with: data)
        completion(true)
    }
    
    func clearChat() {
        let fetchRequest: NSFetchRequest<MessageEntity> = MessageEntity.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            result.forEach { context.delete($0) }
            
            try context.save()
            
            messages.value = [MessageModel]()
        } catch {
            writeLog(type: .coreDataError, message: error.localizedDescription)
        }
    }
}

extension CoreDataLayer {
    private struct Constants {
        static let containerName = "ChatGPT"
        static let messageEntityName = "MessageEntity"
    }
}
