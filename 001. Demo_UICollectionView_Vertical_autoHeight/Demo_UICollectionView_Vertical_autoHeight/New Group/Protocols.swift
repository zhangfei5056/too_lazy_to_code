//
//  Protocols.swift
//  Demo_UICollectionView_Vertical_autoHeight
//
//  Created by Yuan Cao on 6/11/21.
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
    func registerCellsForCollectionView(_ collectionView: UICollectionView)
}
protocol DataManagerProtocol: NSObjectProtocol {
    var sections: [SectionProviderProtocol] { get set }
}
