//
//  MainSceneViewController.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class MainSceneViewController: BaseViewController<MainSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
        registerForKeyboardNotifications()
	}
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        bottomConstraint.constant = Constants.bottomConstraintInitialValue
    }
    
    deinit {
        removeKeyboardNotifications()
    }
	
	private func setup() {
        topViewPaddingConstraint.constant = (AppCore.shared.deviceManager.hasTopNotch ? Constants.topConstraintValueWithNotch : Constants.topConstraintValueWithoutNotch)
        
		interactor?.makeRequest(requestType: .initialSetup)
	}
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [.curveEaseInOut], animations: { [weak self] in
            guard let sSelf = self else { return }
            
            sSelf.bottomConstraint.constant = kbFrameSize.height
        })
        self.view.layoutIfNeeded()
        
        self.tableView.isUserInteractionEnabled = false
    }
    
    @objc private func kbWillHide(_ notification: Notification) {
        bottomConstraint.constant = Constants.bottomConstraintInitialValue
        
        self.view.layoutIfNeeded()
        
        self.tableView.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction private func clearChatButtonAction(_ sender: UIButton) {
        interactor?.makeRequest(requestType: .clearChat)
    }
    
    @IBAction private func sendButtonTapped(_ sender: UIButton) {
        guard let text = newMessageContent.text, !text.isEmpty else { return }
        
        interactor?.makeRequest(requestType: .sendMessage(with: text))
    }
    
    private var tableViewProvider: TableViewProviderType?
    
    @IBOutlet private weak var topViewPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var newMessageContent: UITextField!
}

extension MainSceneViewController: MainSceneViewControllerType {
	func update(viewModelDataType: MainSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
			print("\(self) \(#function) with model instance \(model)")
        case .setupProvider(let model):
            guard let model = model as? MainSceneViewModel else { return }
            
            tableViewProvider = TableViewProvider(for: tableView, with: model)
            tableViewProvider?.registerCells([SentMessageTableViewCell.self,
                                              ReceivedMessageTableViewCell.self])
            tableViewProvider?.onConfigureCell = { [weak self] indexPath in
                guard let provider = self?.tableViewProvider, let model = model.getMessageViewModel(with: indexPath.row) else { return UITableViewCell() }

                if model.isReceived {
                    let tableViewCell: ReceivedMessageTableViewCell = provider.dequeueReusableCell(for: indexPath)
                    tableViewCell.setup(with: model)

                    return tableViewCell
                } else {
                    let tableViewCell: SentMessageTableViewCell = provider.dequeueReusableCell(for: indexPath)
                    tableViewCell.setup(with: model)

                    return tableViewCell
                }
            }
            
            tableViewProvider?.onSelectCell = { [weak self] indexPath in
                self?.interactor?.makeRequest(requestType: .didSelectCell(with: indexPath.row))
            }
        case .reloadProviderData(let model):
            tableViewProvider?.reloadData() { [weak self] in
                guard let lastMessageIndex = model.lastMessageIndex else { return }
                
                self?.tableViewProvider?.scrollToRow(at: IndexPath(row: lastMessageIndex, section: 0), at: .bottom, animated: true)
            }
        case .setViewToInitialState:
            self.view.endEditing(true)
            self.newMessageContent.text = ""
		}
	}
}

extension MainSceneViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CircleShapeTransitionAnimator(isPresenting: true, transitionPoint: self.view.center)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CircleShapeTransitionAnimator(isPresenting: false, transitionPoint: self.view.center)
    }
}

extension MainSceneViewController {
	private struct Constants {
        static let topConstraintValueWithNotch: CGFloat = 44
        static let topConstraintValueWithoutNotch: CGFloat = 24
        static let bottomConstraintInitialValue: CGFloat = 0.0
	}
}
