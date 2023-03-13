//
//  DetailSceneInteractorContract.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailSceneInteractable {
	func makeRequest(requestType: DetailSceneInteractorRequest.RequestType)
}

struct DetailSceneInteractorRequest {
	enum RequestType {
		case initialSetup
	}
}
