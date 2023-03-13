//
//  DetailSceneRouter.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol DetailSceneRoutable {
	static func assembly() -> UIViewController
	func routeTo(scene type: DetailSceneRoutableContractData.DetailSceneRoutableSceneType)
}

class DetailSceneRouter {
	private func prepareDestinationScene(with type: DetailSceneRoutableContractData.DetailSceneRoutableSceneType) -> UIViewController {
		switch type {
		case .testScene: print("\(self) \(#function) msg: 'Test scene'")
		}
		
		return UIViewController()
	}
	
	private weak var view: DetailSceneViewController?
}

extension DetailSceneRouter: DetailSceneRoutable {
	static func assembly() -> UIViewController {
		let router = DetailSceneRouter()
		let vc                  = DetailSceneViewController(nibName: String(describing: DetailSceneViewController.self), bundle: Bundle.main)
		let viewModel           = DetailSceneViewModel()
		let presenterService    = DetailScenePresenterService(withModel: viewModel)
		let presenter           = DetailScenePresenter(for: vc, service: presenterService)
		let interactorService   = DetailSceneInteractorService(withModel: viewModel)
		let interactor          = DetailSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
		router.view = vc
		
		router.view?.interactor = interactor
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: DetailSceneViewController.self))")
		}
		
		return view
	}
	
	func routeTo(scene type: DetailSceneRoutableContractData.DetailSceneRoutableSceneType) {
		let vc = prepareDestinationScene(with: type)
		vc.modalPresentationStyle = .currentContext
		vc.transitioningDelegate = view
		self.view?.present(vc, animated: true)
	}
}
