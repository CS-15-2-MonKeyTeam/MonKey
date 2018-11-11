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
import AccountKit
import SwiftKeychainWrapper
import Apollo

class LoginViewController: UIViewController {
    
    var accountKit = AKFAccountKit(responseType: AKFResponseType.accessToken)
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
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        return label
    }()

    lazy var descriptionText: UILabel = {
        let label = UILabel()
        label.text = "Это приложение поможет Вам в планировании персональных финансов, а также составит план Вашего бюджета с учетом расходов и доходов."
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.setLineSpacing(label: label, spacing: 6)
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
        button.addTarget(self, action: #selector(loginByPhoneNumber), for: .touchUpInside)
        return button
    }()
    
    @objc func loginByPhoneNumber() {
        loginWithPhone()
    }

    func sendToken(accessToken: String) {
        LoginManager.shared.apollo.perform(mutation: SendTokenMutation(accountkitAccessToken: "\(accessToken)")) { (result, error)  in
            if let error = error {
                print(error)
            }
            
            guard let result = result else { return }
            KeychainManager.shared.setUserObject(token: accessToken)
            guard let bearer = result.data?.auth.token else { return }
            KeychainManager.shared.setBearerToken(token: bearer)
        }
    }
}

extension LoginViewController: AKFViewControllerDelegate {
    func prepareLoginViewController(loginViewController: AKFViewController) {
        loginViewController.delegate = self
    }
    
    func loginWithPhone() {
        let inputState = NSUUID().uuidString
        let viewController = accountKit.viewControllerForPhoneLogin(with: nil, state: inputState)
        prepareLoginViewController(loginViewController: viewController)
        present(viewController, animated: true, completion: nil)
    }
    
    func viewController(_ viewController: (UIViewController & AKFViewController)!,
                        didCompleteLoginWith accessToken: AKFAccessToken!, state: String!) {
        
        sendToken(accessToken: accessToken.tokenString)
        RootVCSwitcher.shared.presentUserInputVC()
        
        print("Did complete login with access token \(accessToken.tokenString) state \(state ?? "")")
    }

    func viewController(_ viewController: (UIViewController & AKFViewController)!, didFailWithError error: Error!) {
        print("Login failed with: \(error)")
    }
    
    func viewControllerDidCancel(_ viewController: (UIViewController & AKFViewController)!) {
        print("Login got cancelled")
    }
}

extension UILabel {
    func setLineSpacing(label: UILabel, spacing: CGFloat) {
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
    }
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
