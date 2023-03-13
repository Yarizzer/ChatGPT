//
//  DetailSceneViewController.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class DetailSceneViewController: BaseViewController<DetailSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	private func setup() {
		interactor?.makeRequest(requestType: .initialSetup)
	}
}

extension DetailSceneViewController: DetailSceneViewControllerType {
	func update(viewModelDataType: DetailSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
			print("\(self) \(#function) with model instance \(model)")
		}
	}
}

extension DetailSceneViewController {
	private struct Constants {
		
	}
}
