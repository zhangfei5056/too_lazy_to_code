//
//  ViewController.swift
//  Test_SizeThatFits
//
//  Created by Yuan Cao on 6/30/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let cmViewAuto = CustomView()

    let cmViewManual = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white



        // setup auto
        let vm = CustomViewModel()
        self.view.addSubview(cmViewAuto)
        cmViewAuto.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        print("cmViewAuto🥬🍎\(cmViewAuto.frame)🍎🥬")
        cmViewAuto.setup(viewModel: vm)
        cmViewAuto.setNeedsLayout()
        cmViewAuto.layoutIfNeeded()
        print("cmViewAuto🥬🍎\(cmViewAuto.frame)🍎🥬")


        // setup Manual
        self.view.addSubview(cmViewManual)
        print("cmViewManual🥬🍎\(cmViewManual.frame)🍎🥬")
        cmViewManual.setup(viewModel: vm)
        let cmViewManualWidth = UIScreen.main.bounds.width - 20 * 2

        let size = self.cmViewManual.sizeThatFits(CGSize(width: cmViewManualWidth, height: .greatestFiniteMagnitude)) // (20.0, 20.0, 335.0, 525.0)
        self.cmViewManual.frame = CGRect(x: 20, y: 20, width: size.width, height: size.height)

        print("cmViewManual size🥬🍎\(size)🍎🥬")

        print("cmViewManual🥬🍎\(cmViewManual.frame)🍎🥬")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews cmViewAuto🥬🍎\(cmViewAuto.frame)🍎🥬")
        print("viewDidLayoutSubviews cmViewManual🥬🍎\(cmViewManual.frame)🍎🥬")
    }
}

class CustomViewModel {
    var title: String {
        return "This is title istjidsfjidsafujiadsfjiadsjfiadsjfi asjdfija sdfio jadsif jiadsfj iadsfj iadsfj iadsjf iadsjf iasdjf iadsjf iadsjf;oiadsjfkl;adsjfl;kadsjf lk;adsjflk;adsjfl;adsjfl;kadsjfl;iadsjfl;kadsjdfl;kads jfkl;adsjf"
    }
    var subTitle: String {
        return "This is subtitle istjidsfjidsafujiadsfjiadsjfiadsjfi asjdfija sdfio jadsif jiadsfj iadsfj iadsfj iadsjf iadsjf iasdjf iadsjf iadsjf;oiadsjfkl;adsjfl;kadsjf lk;adsjflk;adsjfl;adsjfl;kadsjfl;iadsjfl;kadsjdfl;kads jfkl;adsjf"
    }
}

class CustomView: UIView {

    lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = .systemPink
        return topView
    }()

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .blue
        titleLabel.numberOfLines = 0
        return titleLabel
    }()

    lazy var midView: UIView = {
        let midView = UIView()
        midView.backgroundColor = .red
        return midView
    }()

    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.backgroundColor = .blue
        subTitleLabel.numberOfLines = 0
        return subTitleLabel
    }()

    lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = .systemRed
        return bottomView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        layout()
    }

    func setupUI() {
        self.backgroundColor = .yellow
        self.addSubview(topView)
        self.addSubview(titleLabel)
        self.addSubview(midView)
        self.addSubview(subTitleLabel)
        self.addSubview(bottomView)
    }

    func setup(viewModel: CustomViewModel) {
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
    }

    func layout() {

        topView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }

        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        midView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }

        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(midView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().inset(20)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let lableTextSize = CGSize(
            width: size.width - 20 * 2,
            height: size.height)

        var height: CGFloat = 0

        height += 20
        height += 40
        height += 20
        let titleHeight = titleLabel.sizeThatFits(lableTextSize).height
        print("titleHeight🥬🍎\(titleHeight)🍎🥬")
        height += titleHeight
        height += 20
        height += 40
        height += 20
        let subHeight = subTitleLabel.sizeThatFits(lableTextSize).height
        print("subHeight🥬🍎\(subHeight)🍎🥬")
        height += subHeight
        height += 20
        height += 40
        height += 20

        return CGSize(width: size.width, height: height)
    }


}
