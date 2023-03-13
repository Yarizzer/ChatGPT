//
//  MainScenePresenterContract.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainScenePresentable {
	func response(responseType: MainScenePresenterResponse.MainSceneResponseType)
}

struct MainScenePresenterResponse {
	enum MainSceneResponseType {
		case initialSetup
        case setViewToInitialState
		case releaseView
	}
}
