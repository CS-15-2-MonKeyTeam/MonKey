//
//  RootVCSwitcher.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/13/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit
import SwiftKeychainWrapper

class RootVCSwitcher {
    
    static let shared = RootVCSwitcher()
    private init() {}
    
    var window: UIWindow?
    
    func initialViewController() {
        if KeychainManager.shared.isUserLoggedIn() {
            if KeychainManager.shared.getUserName() {
                presentTab()
            } else {
                presentUserInputVC()
            }
        } else {
            presentLoginVC()
        }
    }
    
    func presentUserInputVC() {
        let vc = UserInpudDataViewController()
        vc.modalPresentationStyle = .overFullScreen
        changeRoot(to: vc)
    }
    
    func presentLoginVC() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .overFullScreen
        changeRoot(to: vc)
    }
    
    func presentTab() {
        let vc = MainTabViewController()
        var navigationController: UINavigationController?
        guard let unwrappedWindow = window else { return }
        navigationController = UINavigationController(rootViewController: vc)
        unwrappedWindow.rootViewController = navigationController
        unwrappedWindow.makeKeyAndVisible()
    }
    
    func presentNewOperation() {
        let vc = NewOperationViewController()
        changeRoot(to: vc)
    }
    
    
    func changeRoot(to newRootVC: UIViewController) {
        guard let unwrappedWindow = window else { return }
        let oldVC = unwrappedWindow.rootViewController
        
        UIView.transition(with: unwrappedWindow, duration: 0.25, options: .transitionCrossDissolve, animations: {
            unwrappedWindow.rootViewController = newRootVC
        }, completion: { (_) in
            if oldVC != newRootVC {
                if let transitionViewClass = NSClassFromString("UITransitionView") {
                    for subview in unwrappedWindow.subviews where subview.isKind(of: transitionViewClass) {
                        subview.removeFromSuperview()
                    }
                }
                
                oldVC?.dismiss(animated: false, completion: nil)
            }
        })
    }
}
