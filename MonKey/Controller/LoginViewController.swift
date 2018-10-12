//
//  LoginViewController.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/13/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let blueColor = UIColor(red: 127/255, green: 165/255, blue: 229/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        subview()
        layout()
    }
    
    func layout() {
        loginLogo.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(130)
        }
        
        welcomeText.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(loginLogo.snp.bottom).offset(50)
        }
        
        descriptionText.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.top.equalTo(welcomeText.snp.bottom).offset(35)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(220)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
        
        registrationButton.snp.makeConstraints { (make) in
            make.width.equalTo(220)
            make.height.equalTo(50)
            make.bottom.equalTo(loginButton.snp.top).offset(-15)
            make.centerX.equalToSuperview()
        }
    }
    
    func subview() {
        self.view.addSubview(loginLogo)
        self.view.addSubview(welcomeText)
        self.view.addSubview(descriptionText)
        self.view.addSubview(loginButton)
        self.view.addSubview(registrationButton)
    }
    
    lazy var loginLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo.png"))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var welcomeText: UILabel = {
       let label = UILabel()
        label.text = "Добро пожаловать в MonKey"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()

    lazy var descriptionText: UILabel = {
       let label = UILabel()
        label.text = "Это приложение поможет Вам в планировании персональных финансов, а также составит план Вашего бюджета с учетом расходов и доходов."
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name:"Avenir", size: 14.0)
        
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        return label
    }()

    lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = blueColor
        button.layer.cornerRadius = 25
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setTitle("Войти", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = blueColor.cgColor
        button.setTitleColor(blueColor, for: .normal)
        return button
    }()
}
