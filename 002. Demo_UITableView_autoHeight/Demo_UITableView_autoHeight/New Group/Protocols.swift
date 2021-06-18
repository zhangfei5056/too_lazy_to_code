//
//  Protocols.swift
//  Demo_UITableView_autoHeight
//
//  Created by Yuan Cao on 6/18/21.
//

import UIKit

protocol CellProtocol {
    static var reuseId: String { get }
    func setup(_ viewModel: CellViewModelProtocol)
}
protocol CellViewModelProtocol {
    var reuseId: String { get }
}

protocol SectionProviderProtocol {
    var items: [CellViewModelProtocol] { get }
    func generateItems()
    func registerCellsForTableView(_ tableView: UITableView)
}
protocol DataManagerProtocol: NSObjectProtocol {
    var sections: [SectionProviderProtocol] { get set }
}
