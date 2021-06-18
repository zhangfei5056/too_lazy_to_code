//
//  CollectionViewHelper.swift
//  Demo_UICollectionView_Vertical_autoHeight
//
//  Created by Yuan Cao on 6/11/21.
//

import UIKit


class CollectionViewHelper: NSObject {
    var dataManager: DataManagerProtocol?
    var sections: [SectionProviderProtocol] {
        return dataManager?.sections ?? []
    }
}

// MARK: UICollectionViewDataSource
extension CollectionViewHelper: UICollectionViewDataSource {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = sections[indexPath.section].items[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseId, for: indexPath) as? CellProtocol else {
            return UICollectionViewCell()
        }
        cell.setup(viewModel)

        if let cell = cell as? UICollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension CollectionViewHelper: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return viewModel.cellSize
//    }

    private func sectionInsets(section: Int) -> UIEdgeInsets {
        return .zero
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .zero
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               referenceSizeForFooterInSection section: Int) -> CGSize {
        return .zero
    }
}

