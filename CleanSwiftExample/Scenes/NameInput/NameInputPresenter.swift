//
//  NameInputPresenter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

protocol NameInputPresentationLogic {
    func proceedWithName(response: NameInput.Name.Response)
}

class NameInputPresenter: NameInputPresentationLogic {
    weak var viewController: NameInputDisplayLogic?

    // MARK: - Present something

    func proceedWithName(response: NameInput.Name.Response) {
        let viewModel = NameInput.Name.ViewModel(userName: response.userName)
        viewController?.proceedToNextScreen(viewModel: viewModel)
    }
}
