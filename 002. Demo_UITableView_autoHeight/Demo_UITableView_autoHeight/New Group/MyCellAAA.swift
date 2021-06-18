//
//  MyCellAAA.swift
//  Demo_UITableView_autoHeight
//
//  Created by Yuan Cao on 6/18/21.
//

import UIKit

class MyCellAAA: UITableViewCell, CellProtocol {

    static var reuseId: String = String(describing: MyCellAAA.self)
    var viewModel: MyCellAAAViewModel?
    let label = UILabel()
    let label2 = UILabel()
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

        label2.font = UIFont.systemFont(ofSize: 14)
        label2.numberOfLines = 0
        label2.textColor = .black
        label2.backgroundColor = .white
        self.contentView.addSubview(label2)

        divideLineView.backgroundColor = .green
        self.contentView.addSubview(divideLineView)
    }

    func makeConstraints() {
        label.snp.makeConstraints { (make) in
            make.width.equalTo(260)
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        label2.snp.makeConstraints { (make) in
            make.width.equalTo(260)
            make.top.equalTo(label.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        divideLineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
            make.trailing.leading.equalToSuperview()
        }
    }

    func setup(_ viewModel: CellViewModelProtocol) {
        if let viewModel = viewModel as? MyCellAAAViewModel {
            self.viewModel = viewModel
        }
        label.text = "bbb111\nbbb111\nbbb11\n"
        label2.text = "bbbbbb222\nbbbbb222\nbbbbb22gr\nbbbb22"
        contentView.backgroundColor = .red
    }
}

class MyCellAAAViewModel: CellViewModelProtocol {

    var reuseId: String {
        return MyCellAAA.reuseId
    }
}
