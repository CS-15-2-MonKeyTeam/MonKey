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
import Apollo

class LoginManager {
    static let shared = LoginManager()
    private init() {}
    
    let accountKit = AKFAccountKit(responseType: AKFResponseType.accessToken)
    
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let token = KeychainManager.shared.getBearertoken()
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)"]
        
        let url = URL(string: "https://monkey-graphql-api.herokuapp.com")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    func logout() {
        accountKit.logOut()
        KeychainManager.shared.removeUserObject()
    }
}
