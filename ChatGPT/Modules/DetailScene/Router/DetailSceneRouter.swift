//
//  DetailSceneRouter.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol DetailSceneRoutable {
    static func assembly(with data: MessageModel) -> UIViewController
	func dismiss()
}

class DetailSceneRouter {
	private weak var view: DetailSceneViewController?
}

extension DetailSceneRouter: DetailSceneRoutable {
	static func assembly(with data: MessageModel) -> UIViewController {
		let router = DetailSceneRouter()
		let vc                  = DetailSceneViewController(nibName: String(describing: DetailSceneViewController.self), bundle: Bundle.main)
        let viewModel           = DetailSceneViewModel(with: data)
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
	
    func dismiss() {
        view?.dismiss(animated: true)
    }
}
