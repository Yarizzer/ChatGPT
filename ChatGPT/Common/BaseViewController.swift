//
//  BaseViewController.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

class BaseViewController<IntreactorT>: UIViewController {
    override func viewDidLoad() { super.viewDidLoad() }
    
    var interactor: IntreactorT?
}
