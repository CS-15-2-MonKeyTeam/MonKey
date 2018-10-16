//
//  UserInputDataViewController.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/13/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class UserInpudDataViewController: UIViewController {
    
    let blueColor = UIColor(red: 127/255, green: 165/255, blue: 229/255, alpha: 1.0)
    var userData: [String: String] = ["user_name": String()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        subview()
        layout()
    }
    
    func layout() {
        nextButton.snp.makeConstraints { (make) in
            make.width.equalTo(220)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
        
        welcomTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(110)
        }
        
        subtitle.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.top.equalTo(welcomTitle.snp.bottom).offset(30)
        }
        
        userNameTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(30)
            make.top.equalTo(subtitle.snp.bottom).offset(50)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(10)
            make.centerY.equalTo(view.snp.top).offset(50)
        }
    }
    
    func subview() {
        self.view.addSubview(nextButton)
        self.view.addSubview(welcomTitle)
        self.view.addSubview(subtitle)
        self.view.addSubview(userNameTextField)
        self.view.addSubview(backButton)
    }

    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = blueColor
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Введите имя", for: .disabled)
        button.setTitle("Дальше", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(sendUserData), for: .touchUpInside)
        return button
    }()
    
    lazy var welcomTitle: UILabel = {
        let label = UILabel()
        label.text = "Остался последний шаг"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Как бы Вы хотели, чтоб мы Вас называли?\nВы всегда можете изменить своё имя в настройках профиля."
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.setLineSpacing(label: label, spacing: 5)
        return label
    }()
    
    lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .center
        textField.placeholder = "Введите своё имя"
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        return textField
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Назад", for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    
    func getUserName() -> [String: String] {
        let userNameText = userNameTextField.text
        userData["user_name"] = userNameText
        return userData
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        let enabled = !(textField.text?.isEmpty ?? true)
        nextButton.isEnabled = enabled
    }
    
    @objc func sendUserData() {
        RootVCSwitcher.shared.presentMainVC()
//        LoginManager.shared.sendUserData(userData: getUserName())
    }
    
    @objc func backAction() {
        RootVCSwitcher.shared.presentLoginVC()
        LoginManager.shared.logout()
    }
}
