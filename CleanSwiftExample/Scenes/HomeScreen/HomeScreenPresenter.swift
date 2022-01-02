//
//  HomeScreenPresenter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 02.01.2022.
//

import Foundation

protocol HomeScreenPresentationLogic {
    func presentGreeting(response: HomeScreen.Home.Response)
}

class HomeScreenPresenter: HomeScreenPresentationLogic {
    weak var viewController: HomeScreenViewController?
    
    func presentGreeting(response: HomeScreen.Home.Response) {
        let viewModel = HomeScreen.Home.ViewModel()
        viewController?.displayGreeting(viewModel: viewModel)
    }
}
