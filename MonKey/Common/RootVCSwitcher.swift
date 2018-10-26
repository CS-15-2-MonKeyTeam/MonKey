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
        // TODO:- Remove keychain proccessing from rootVcSwitcher. Create KeychainManager for this stuff
        let isLogged = KeychainWrapper.standard.string(forKey: "userToken")
        if isLogged != nil {
            window?.rootViewController = MainViewController()
        } else {
            window?.rootViewController = LoginViewController()
        }
    }
    
    func presentUserInputVC() {
        let vc = UserInpudDataViewController()
        vc.modalPresentationStyle = .overFullScreen
        changeRoot(to: vc)
    }
    
    func presentMainVC() {
        let sourceSelectorTableViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: sourceSelectorTableViewController)
        changeRoot(to: navigationController)
    }
    
    func presentLoginVC() {
        let vc = LoginViewController()
        changeRoot(to: vc)
    }
    
    func changeRoot(to newRootVC: UIViewController) {
        guard let unwrappedWindow = window else { return }
        let oldVC = unwrappedWindow.rootViewController
        
        UIView.transition(with: unwrappedWindow, duration: 0.25, options: .transitionCrossDissolve, animations: {
            unwrappedWindow.rootViewController = newRootVC
        }, completion: { (_) in
            if oldVC != newRootVC {
                // see: https://stackoverflow.com/questions/26763020/leaking-views-when-changing-rootviewcontroller-inside-transitionwithview
                // old view controller is retained after chaing root view controller, so we have to manually dismiss it.
                // not just, but also cleanup views in UITransitionView. Weird.
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
