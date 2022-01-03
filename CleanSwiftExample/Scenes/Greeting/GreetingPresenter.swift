//
//  GreetingPresenter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

protocol GreetingPresentationLogic {
    func presentGreeting(response: Greeting.Name.Response)
}

class GreetingPresenter: GreetingPresentationLogic {
    weak var viewController: GreetingDisplayLogic?

    // MARK: - Present something

    func presentGreeting(response: Greeting.Name.Response) {
        let viewModel = Greeting.Name.ViewModel(userName: response.userName)
        viewController?.displayGreeting(viewModel: viewModel)
    }
}
