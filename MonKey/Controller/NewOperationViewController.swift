//
//  NewOperationViewController.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/28/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import UIKit
import SnapKit

class NewOperationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Добавить сумму"
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveOperation))
        subview()
        layout()
    }
    
    @objc func saveOperation() {
        print("saved")
    }
    
    lazy var testButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.OperationColor.incomeColor
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Дальше", for: .normal)
        button.addTarget(self, action: #selector(sendUserData), for: .touchUpInside)
        return button
    }()
    
    @objc func sendUserData() {
        print("aga")
    }
    
    func layout() {
        testButton.snp.makeConstraints { (make) in
            make.width.equalTo(220)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
    }
    
    func subview() {
        self.view.addSubview(testButton)
    }
    
    
}
