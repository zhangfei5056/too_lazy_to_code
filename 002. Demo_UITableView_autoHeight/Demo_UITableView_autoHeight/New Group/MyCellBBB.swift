//
//  MyCellBBB.swift
//  Demo_UITableView_autoHeight
//
//  Created by Yuan Cao on 6/18/21.
//

import UIKit

class MyCellBBB: UITableViewCell, CellProtocol {
    static var reuseId: String = String(describing: MyCellBBB.self)
    var viewModel: MyCellBBBViewModel?
    let label = UILabel()
    let divideLineView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .white
        self.contentView.addSubview(label)

        divideLineView.backgroundColor = .green
        self.contentView.addSubview(divideLineView)
    }

    func makeConstraints() {
        label.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.top.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        divideLineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
            make.trailing.leading.equalToSuperview()
        }
    }

    func setup(_ viewModel: CellViewModelProtocol) {
        if let viewModel = viewModel as? MyCellBBBViewModel {
            self.viewModel = viewModel
        }

        label.text = "111\n111\n1111\n11111\n"
        contentView.backgroundColor = .red
    }
}

class MyCellBBBViewModel: CellViewModelProtocol {

    var reuseId: String {
        return MyCellBBB.reuseId
    }
}
