//
//  MainSceneInteractorContract.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneInteractable {
	func makeRequest(requestType: MainSceneInteractorRequest.RequestType)
}

struct MainSceneInteractorRequest {
	enum RequestType {
		case initialSetup
        case sendMessage(with: String)
        case clearChat
        case didSelectCell(with: Int)
	}
}
