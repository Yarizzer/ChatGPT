//
//  InitialSceneViewController.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class InitialSceneViewController: BaseViewController<InitialSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: Constants.initialAnimationDuration, delay: 0, options: [.curveEaseInOut], animations: { [weak self] in
            guard let sSelf = self else { return }
            
            #warning("place to hold some animation here")
            
            sSelf.view.layoutIfNeeded()
        }) { [weak self] _ in
            self?.interactor?.makeRequest(requestType: .routeToMainScene)
        }
    }
	
	private func setup() {
		interactor?.makeRequest(requestType: .initialSetup)
	}
}

extension InitialSceneViewController: InitialSceneViewControllerType {
	func update(viewModelDataType: InitialSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
			print("\(self) \(#function) with model instance \(model)")
		}
	}
}

extension InitialSceneViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BlurTransitionAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BlurTransitionAnimator()
    }
}

extension InitialSceneViewController {
	private struct Constants {
        static let initialAnimationDuration: Double = 5
	}
}
