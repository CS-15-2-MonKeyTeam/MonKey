//
//  User.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/13/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class KeychainManager {
    
    private init() {}
    static let shared = KeychainManager()
    
    private let kAccountKitAccessToken = "kAccountKitAccessToken"
    private let kBearerToken = "kBearerToken"
    private let kUserName = "kUserName"
    
    func saveUserName(name: String) {
        KeychainWrapper.standard.set(name, forKey: kUserName)
    }
    
    func getUserName() -> Bool {
        return KeychainWrapper.standard.string(forKey: kUserName) != nil
    }
    
    func setUserObject(token: String) {
        KeychainWrapper.standard.set(token, forKey: kAccountKitAccessToken)
    }
    
    func setBearerToken(token: String) {
        KeychainWrapper.standard.set(token, forKey: kBearerToken)
    }
    
    func getBearertoken() -> String {
        guard let bearer = KeychainWrapper.standard.string(forKey: kBearerToken) else { return ""}
        return bearer
    }
    
    func isUserLoggedIn() -> Bool {
        return KeychainWrapper.standard.string(forKey: kAccountKitAccessToken) != nil
    }
    
    func removeUserObject() {
        KeychainWrapper.standard.removeObject(forKey: kAccountKitAccessToken)
    }
    
}
