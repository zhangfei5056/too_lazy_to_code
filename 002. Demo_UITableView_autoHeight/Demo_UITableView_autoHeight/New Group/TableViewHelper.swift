//
//  TableViewHelper.swift
//  Demo_UITableView_autoHeight
//
//  Created by Yuan Cao on 6/18/21.
//

import UIKit

class TabelViewHelper: NSObject {
    var dataManager: DataManagerProtocol?
    var sections: [SectionProviderProtocol] {
        return dataManager?.sections ?? []
    }
}

extension TabelViewHelper: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sections[indexPath.section].items[indexPath.item]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseId, for: indexPath) as? CellProtocol else {
            return UITableViewCell()
        }
        cell.setup(viewModel)

        if let cell = cell as? UITableViewCell {
            return cell
        }
        return UITableViewCell()
    }
}
