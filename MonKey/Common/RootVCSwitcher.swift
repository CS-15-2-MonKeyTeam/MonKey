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
        KeychainManager.shared.isUserLoggedIn() ? presentTab() : presentLoginVC() // add checking user name in future
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
        vc.modalPresentationStyle = .overFullScreen
        changeRoot(to: vc)
    }
    
    func presentNewOperation() {
        let vc = NewOperationViewController()
//        vc.modalPresentationStyle = .overFullScreen
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
