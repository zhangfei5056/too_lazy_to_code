//
//  ViewController.swift
//  Test_push_remove
//
//  Created by Yuan Cao on 6/30/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.backgroundColor = .white
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 100, width: 100, height: 80)
        button.backgroundColor = .black
        button.setTitle("VC", for: .normal)
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        self.view.addSubview(button)

    }

    @objc
    func action() {
        let nav = UINavigationController(rootViewController: A_VC())
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }


}

