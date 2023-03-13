//
//  MainSceneViewModel.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneViewModelType {
    func setupSubscription()
    var shouldUpdateData: Publisher<Bool?> { get }
    
    var lastMessageIndex: Int? { get }
    
    func getMessageViewModel(with index: Int) -> MessageTableViewCellViewModelType?
    func sendMessage(with content: String)
    func clearChat()
}

class MainSceneViewModel {
    init() {
        self.messages = AppCore.shared.databaseManager.messages.value
    }
    
    func setupSubscription() {
        AppCore.shared.databaseManager.messages.subscribe(self) { [weak self] data in
            self?.messages = data.newValue
        }
    }
    
    private var messages: [MessageModel]? {
        didSet {
            shouldUpdateData.value = true
        }
    }
    
    var shouldUpdateData: Publisher<Bool?> = Publisher(nil)
}

extension MainSceneViewModel: MainSceneViewModelType {
    var lastMessageIndex: Int? {
        guard let messages = messages, !messages.isEmpty else { return nil }
        
        return messages.count - 1
    }
    
    func getMessageViewModel(with index: Int) -> MessageTableViewCellViewModelType? {
        guard let message = messages?[index] else { return nil }
        
        return MessageTableViewCellViewModel(with: message)
    }
    
    func sendMessage(with content: String) {
        AppCore.shared.databaseManager.sendMessage(with: MessageModel(with: content, for: .sent))
    }
    
    func clearChat() {
        AppCore.shared.databaseManager.clearChat()
    }
}

extension MainSceneViewModel: TableViewProviderViewModel {
    var numberOfTableSections: Int { return Constants.numberOfSections }
    
    func numberOfTableRowsInSection(_ section: Int) -> Int {
        messages?.count ?? 0
    }
    
    func heightForRow(atIndex index: Int) -> Float {
        guard let message = messages?[index] else { return Constants.defaultRowHeightValue }
        
        let numberOfLines: Float = message.content.reduce(into: 0) { (count, letter) in
            count += letter == "\n" ? 1 : 0
        }
        
        let estimateStringLength = Float(message.content.count) * Constants.estimateCharWidthValue
        let estCharHeight = Constants.estimateCharHeightValue
        let value = (estimateStringLength / Constants.cellWidth) * estCharHeight + Constants.defaultRowHeightValue
        
        return value < numberOfLines * Constants.estimateCharHeightValue ? (numberOfLines * Constants.estimateCharHeightValue) : value
    }
}

extension MainSceneViewModel {
    private struct Constants {
        static let numberOfSections = 1
        static let defaultRowHeightValue: Float = 50
        static let estimateCharWidthValue: Float = 7.0
        static let estimateCharHeightValue: Float = 36.0
        static let sentDateHeightValue: Float = 12.0
        
        static let cellWidth: Float = Float(AppCore.shared.deviceManager.screenSize.width) - 130
    }
}
