//
//  DetailSceneViewModel.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol DetailSceneViewModelType {
	
}

class DetailSceneViewModel {
    init(with data: MessageModel) {
        self.data = data
    }
    
    private let data: MessageModel
}

extension DetailSceneViewModel: DetailSceneViewModelType {
	
}
