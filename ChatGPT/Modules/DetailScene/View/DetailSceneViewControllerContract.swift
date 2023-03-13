//
//  DetailSceneViewControllerContract.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailSceneViewControllerType {
	func update(viewModelDataType: DetailSceneViewControllerViewModel.ViewModelDataType)
}

struct DetailSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: DetailSceneViewModelType)
	}
}
