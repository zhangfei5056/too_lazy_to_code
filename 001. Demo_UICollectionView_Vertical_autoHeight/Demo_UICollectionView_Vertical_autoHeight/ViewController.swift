//
//  ViewController.swift
//  Demo_UICollectionView_Vertical_autoHeight
//
//  Created by Yuan Cao on 6/10/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    var sections: [SectionProviderProtocol] = [SectionProvider2(), SectionProvider()]
    var collectionViewHelper = CollectionViewHelper()
    var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 20)
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        layout.sectionInset = .zero
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        sections.forEach { $0.registerCellsForCollectionView(collectionView) }
        collectionViewHelper.dataManager = dataManager
        collectionView.dataSource = collectionViewHelper
        collectionView.delegate = collectionViewHelper
        collectionView.backgroundColor = .gray
        view.addSubview(collectionView)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.reloadData()
        collectionView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
