//
//  ViewController.swift
//  Demo_UITableView_autoHeight
//
//  Created by Yuan Cao on 6/18/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var tableView: UITableView!
    var sections: [SectionProviderProtocol] = [SectionProvider2(), SectionProvider()]
    var tableViewHelper = TabelViewHelper()
    var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: .zero, style: .plain)
        sections.forEach { $0.registerCellsForTableView(tableView) }
        tableViewHelper.dataManager = dataManager
        tableView.delegate = tableViewHelper
        tableView.dataSource = tableViewHelper
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
