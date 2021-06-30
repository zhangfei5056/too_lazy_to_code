//
//  B_VC.swift
//  Test_push_remove
//
//  Created by Yuan Cao on 6/30/21.
//

import UIKit

class B_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 100, width: 100, height: 80)
        button.backgroundColor = .black
        button.setTitle("B_VC", for: .normal)
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        self.view.addSubview(button)

    }

    @objc
    func action() {
        self.navigationController?.pushViewController(C_VC(), animated: true)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBackNavBarButton()

    }

    func setupBackNavBarButton() {
        let barButton = UIButton(type: .system)
        let buttonImage = UIImage(named: "modal_close")?.withRenderingMode(.alwaysTemplate)
//        barButton.tintColor = .white
        barButton.setImage(buttonImage, for: .normal)
        barButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        barButton.sizeToFit()
        barButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButton)
    }

    @objc
    func backButtonPressed() {

    }
}
