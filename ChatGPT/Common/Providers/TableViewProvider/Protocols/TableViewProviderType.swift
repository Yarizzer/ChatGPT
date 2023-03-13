//
//  TableViewProviderType.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import UIKit

protocol TableViewProviderType {
    var onConfigureCell: ((IndexPath) -> UITableViewCell)? { get set }
    var onSelectCell: ((IndexPath) -> Void)? { get set }
    var onSlidedCell: ((IndexPath) -> UISwipeActionsConfiguration?)? { get set }
    func registerCells(_ cells: [UITableViewCell.Type])
    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T: UITableViewCell
    func scrollToRow(at index: IndexPath, at: UITableView.ScrollPosition, animated: Bool)
    func reloadData(completion: @escaping() -> ())
}
