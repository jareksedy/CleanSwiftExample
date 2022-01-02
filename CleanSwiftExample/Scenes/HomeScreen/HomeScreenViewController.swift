//
//  HomeScreenViewController.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import UIKit

protocol HomeScreenDisplayLogic {
    func displayGreeting(viewModel: HomeScreen.Home.ViewModel)
}

class HomeScreenViewController: UIViewController, HomeScreenDisplayLogic {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var interactor: HomeScreenBusinessLogic?
    var router: (HomeScreenRoutingLogic & HomeScreenDataPassing)?
    
    private func construct() {
        let viewController = self
        let interactor = HomeScreenInteractor()
        let presenter = HomeScreenPresenter()
        let router = HomeScreenRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func displayGreeting(viewModel: HomeScreen.Home.ViewModel) {
        welcomeLabel.text = "Welcome\n \(viewModel.userName ?? "Unknown")..."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        construct()
    }
}
