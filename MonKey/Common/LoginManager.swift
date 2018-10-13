//
//  LoginManager.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/13/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import Foundation
import AccountKit
import SwiftKeychainWrapper

class LoginManager {
    static let shared = LoginManager()
    private init() {}
    
    let accountKit = AKFAccountKit(responseType: AKFResponseType.accessToken)
    
    func logout() {
        // TODO:- Remove keychain proccessing from LoginManager. Create KeychainManager for this stuff
        accountKit.logOut()
        KeychainWrapper.standard.removeObject(forKey: "userToken")
    }
}
