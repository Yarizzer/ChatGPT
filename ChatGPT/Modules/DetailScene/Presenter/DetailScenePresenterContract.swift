//
//  DetailScenePresenterContract.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailScenePresentable {
	func response(responseType: DetailScenePresenterResponse.DetailSceneResponseType)
}

struct DetailScenePresenterResponse {
	enum DetailSceneResponseType {
		case initialSetup
		case releaseView
	}
}
