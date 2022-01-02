//
//  AuthScreenInteractor.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import Foundation

protocol AuthScreenBusinessLogic {
    func authenticate(request: AuthScreen.Auth.Request)
}

protocol AuthScreenDataStore {
    var userName: String? { get set }
}

class AuthScreenInteractor: AuthScreenBusinessLogic, AuthScreenDataStore {
    var dataStore: AuthScreenDataStore?
    var presenter: AuthScreenPresentationLogic?
    var userName: String?
    
    func authenticate(request: AuthScreen.Auth.Request) {
        guard let passcode = request.passcode else { return }
        
        let authenticator = Authenticator()
        let authenticationResult = authenticator.authenticate(with: passcode)
        
        if authenticationResult.0 {
            let response = AuthScreen.Auth.Response(success: true, userName: authenticationResult.1)
            userName = authenticationResult.1
            presenter?.presentAuthenticate(response: response)
        } else {
            let response = AuthScreen.Auth.Response(success: false, userName: nil)
            presenter?.presentAuthenticate(response: response)
        }
    }
}
