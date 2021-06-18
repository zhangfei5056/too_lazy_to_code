//
//  DataManager.swift
//  Demo_UICollectionView_Vertical_autoHeight
//
//  Created by Yuan Cao on 6/11/21.
//

import UIKit

class SectionProvider: SectionProviderProtocol {
    var items: [CellViewModelProtocol] = []
    func generateItems() {
        items = [MyCellAAAViewModel(), MyCellAAAViewModel(), MyCellAAAViewModel(), MyCellAAAViewModel(), MyCellAAAViewModel(), MyCellAAAViewModel()]
    }
    func registerCellsForCollectionView(_ collectionView: UICollectionView) {
        collectionView.register(MyCellAAA.self, forCellWithReuseIdentifier: MyCellAAA.reuseId)
    }
}

class SectionProvider2: SectionProviderProtocol {
    var items: [CellViewModelProtocol] = []

    func generateItems() {
        items = [MyCellBBBViewModel(), MyCellBBBViewModel(), MyCellBBBViewModel(), MyCellBBBViewModel()]
    }
    func registerCellsForCollectionView(_ collectionView: UICollectionView) {
        collectionView.register(MyCellBBB.self, forCellWithReuseIdentifier: MyCellBBB.reuseId)
    }
}

class DataManager: NSObject, DataManagerProtocol {

    var sections: [SectionProviderProtocol] = []
    let sectionA = SectionProvider()
    let sectionB = SectionProvider2()

    override init() {
        // 1. generate secionts
        sections.append(sectionA)
        sections.append(sectionB)
        // 2. regiest everycell from sections
        sections.forEach { (sectionProvider) in
            sectionProvider.generateItems()
        }
        // 3. fetch data & update to sections
        // 4. reload collectionView
    }

    func fetchData(completion: ((Error?) -> Void)? = nil) {

    }
}
