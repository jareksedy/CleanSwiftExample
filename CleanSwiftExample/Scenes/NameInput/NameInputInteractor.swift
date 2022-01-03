//
//  NameInputInteractor.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

protocol NameInputBusinessLogic {
    func proceed(request: NameInput.Name.Request)
}

protocol NameInputDataStore {
    var userName: String? { get set }
}

class NameInputInteractor: NameInputBusinessLogic, NameInputDataStore {
    var presenter: NameInputPresentationLogic?
    var userName: String?

    // MARK: - Do something

    func proceed(request: NameInput.Name.Request) {
        let response = NameInput.Name.Response(userName: request.userName)
        userName = "\(request.userName)!"
        presenter?.proceedWithName(response: response)
    }
}
