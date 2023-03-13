//
//  TableViewProvider.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

class TableViewProvider: NSObject {
    init(for tableView: UITableView, with model: TableViewProviderViewModel) {
        self.tableView = tableView
        self.viewModel = model
        
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    var onConfigureCell: ((IndexPath) -> UITableViewCell)?
    var onSelectCell: ((IndexPath) -> Void)?
    var onSlidedCell: ((IndexPath) -> UISwipeActionsConfiguration?)?
    
    private let tableView: UITableView
    private let viewModel: TableViewProviderViewModel
}

extension TableViewProvider: TableViewProviderType {
    func registerCells(_ cells: [UITableViewCell.Type]) {
        cells.forEach { registerCell($0) }
    }
    
    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T : UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }
        
        return cell
    }
    
    private func registerCell<T>(_ type: T.Type) where T: UITableViewCell {
        if let nibLoadableType = type as? NibLoadableView.Type {
            let nib = UINib(nibName: nibLoadableType.nibName, bundle: Bundle(for: type.self))
            tableView.register(nib, forCellReuseIdentifier: String(describing: type))
        } else {
            tableView.register(type.self, forCellReuseIdentifier: String(describing: type))
        }
    }
    
    func scrollToRow(at index: IndexPath, at: UITableView.ScrollPosition, animated: Bool) {
        tableView.scrollToRow(at: index, at: .bottom, animated: true)
    }
    
    func reloadData(completion: @escaping() -> ()) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            completion()
        }
        
    }
}

extension TableViewProvider: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfTableSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfTableRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let onConfigureCell = onConfigureCell else { fatalError("Need to init onConfigureCell") }
        
        return onConfigureCell(indexPath)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return onSlidedCell?(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.heightForRow(atIndex: indexPath.row))
    }
}

extension TableViewProvider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        onSelectCell?(indexPath)
    }
}
