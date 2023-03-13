//
//  TableViewProviderViewModel.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

protocol TableViewProviderViewModel {
    var numberOfTableSections: Int { get }
    func numberOfTableRowsInSection(_ section: Int) -> Int
    func heightForRow(atIndex index: Int) -> Float
}
