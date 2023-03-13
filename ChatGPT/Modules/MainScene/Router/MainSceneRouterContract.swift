//
//  MainSceneRouterContract.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

struct MainSceneRoutableContractData {
	enum MainSceneRoutableSceneType {
        case detailScene(withData: MessageModel)
	}
}
