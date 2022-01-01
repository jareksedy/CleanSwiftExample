//
//  AuthScreenPresenter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import Foundation

protocol AuthScreenPresentationLogic {
    func presentAuthenticate(response: AuthScreen.Auth.Response)
}

class AuthScreenPresenter: AuthScreenPresentationLogic {
    weak var viewController: AuthScreenViewController?
    
    func presentAuthenticate(response: AuthScreen.Auth.Response) {
        let viewModel = AuthScreen.Auth.ViewModel(success: response.success)
        viewController?.displayAuth(viewModel: viewModel)
    }
}
