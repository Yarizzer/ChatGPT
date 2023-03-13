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
        
        topPaddingConstraint.constant = AppCore.shared.deviceManager.topPaddingValue
	}
    
    @IBAction private func backButtonAction(_ sender: UIButton) {
        interactor?.makeRequest(requestType: .dismiss)
    }
    
    @IBAction private func volumeSliderAction(_ sender: UISlider) {
        interactor?.makeRequest(requestType: .update(with: .updateVolume(with: sender.value)))
    }
    
    @IBAction private func pitchSliderAction(_ sender: UISlider) {
        interactor?.makeRequest(requestType: .update(with: .updatePitch(with: sender.value)))
    }
    
    @IBAction private func rateSliderAction(_ sender: UISlider) {
        interactor?.makeRequest(requestType: .update(with: .updateRate(with: sender.value)))
    }
    
    @IBAction private func talkButtonAction(_ sender: UIButton) {
        interactor?.makeRequest(requestType: .update(with: .startTalk))
    }
    
    @IBAction private func silenceButtonAction(_ sender: UIButton) {
        interactor?.makeRequest(requestType: .update(with: .pause))
    }
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var textView: UITextView!
}

extension DetailSceneViewController: DetailSceneViewControllerType {
	func update(viewModelDataType: DetailSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            self.textView.text = model.text
		}
	}
}

extension DetailSceneViewController {
	private struct Constants { }
}
