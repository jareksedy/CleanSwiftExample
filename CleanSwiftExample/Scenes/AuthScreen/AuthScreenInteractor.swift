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

protocol AuthScreenDataStore {}

class AuthScreenInteractor: AuthScreenBusinessLogic, AuthScreenDataPassing {
    var dataStore: AuthScreenDataStore?
    var presenter: AuthScreenPresentationLogic?
    
    func authenticate(request: AuthScreen.Auth.Request) {
        guard let passcode = request.passcode else { return }
        
        let authenticator = Authenticator()
        
        if authenticator.authenticate(with: passcode) {
            let response = AuthScreen.Auth.Response(success: true)
            presenter?.presentAuthenticate(response: response)
        } else {
            let response = AuthScreen.Auth.Response(success: false)
            presenter?.presentAuthenticate(response: response)
        }
    }
}
