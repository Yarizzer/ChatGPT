//
//  MainSceneRouter.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol MainSceneRoutable {
	static func assembly() -> UIViewController
	func routeTo(scene type: MainSceneRoutableContractData.MainSceneRoutableSceneType)
}

class MainSceneRouter {
	private func prepareDestinationScene(with type: MainSceneRoutableContractData.MainSceneRoutableSceneType) -> UIViewController {
		switch type {
		case .testScene: print("\(self) \(#function) msg: 'Test scene'")
		}
		
		return UIViewController()
	}
	
	private weak var view: MainSceneViewController?
}

extension MainSceneRouter: MainSceneRoutable {
	static func assembly() -> UIViewController {
		let router = MainSceneRouter()
		let vc                  = MainSceneViewController(nibName: String(describing: MainSceneViewController.self), bundle: Bundle.main)
		let viewModel           = MainSceneViewModel()
		let presenterService    = MainScenePresenterService(withModel: viewModel)
		let presenter           = MainScenePresenter(for: vc, service: presenterService)
		let interactorService   = MainSceneInteractorService(withModel: viewModel)
		let interactor          = MainSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
		router.view = vc
		
		router.view?.interactor = interactor
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: MainSceneViewController.self))")
		}
		
		return view
	}
	
	func routeTo(scene type: MainSceneRoutableContractData.MainSceneRoutableSceneType) {
		let vc = prepareDestinationScene(with: type)
		vc.modalPresentationStyle = .currentContext
		//vc.transitioningDelegate = view       //Setup custom transition here
		self.view?.present(vc, animated: true)
	}
}
