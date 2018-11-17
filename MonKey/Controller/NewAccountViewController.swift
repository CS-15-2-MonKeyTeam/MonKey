//
//  NewAccountViewController.swift
//  MonKey
//
//  Created by Rodion Kuskov on 11/12/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Apollo

class NewAccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        addSubview()
        addLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.title = "Счета"
    }
    
    lazy var noteTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.textAlignment = .center
        field.placeholder = "Добавьте примечание"
        field.setBottomBorder()
        return field
    }()
    
    lazy var payeeTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.textAlignment = .center
        field.placeholder = "Добавьте назначение"
        field.setBottomBorder()
        return field
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Send"
        return button
    }()
    
    func addSubview() {
        self.view.addSubview(noteTextField)
        self.view.addSubview(payeeTextField)
        self.view.addSubview(button)
    }
    
    func addLayout() {
        
        noteTextField.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-15)
            make.height.equalTo(30)
            make.center.equalToSuperview()
        }
        
        payeeTextField.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-15)
            make.height.equalTo(30)
            make.top.equalTo(noteTextField.snp.bottom).offset(10)
        }
        
        button.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.width.equalTo(30)
            make.center.equalToSuperview()
        }
        
        
    }
}
