//
//  TestTemplatePresenter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

protocol TestTemplatePresentationLogic {
    func presentSomething(response: TestTemplate.Something.Response)
}

class TestTemplatePresenter: TestTemplatePresentationLogic {
    weak var viewController: TestTemplateDisplayLogic?

    // MARK: - Do something

    func presentSomething(response: TestTemplate.Something.Response) {
        let viewModel = TestTemplate.Something.ViewModel(userName: response.userName, userEmail: response.userEmail, userPhoneNo: response.userPhoneNo)
        viewController?.displaySomething(viewModel: viewModel)
    }
}
