//
//  CoreDataLayerType.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

protocol CoreDataLayerType {
    func runSession()
    func closeSession()
    //Publishers
    var messages: Publisher<[MessageModel]?> { get }
    
    func createMessage(with data: MessageModel)
    func createMessage(with data: MessageModel, completion: @escaping(Bool) -> ())
    func clearChat()
}
