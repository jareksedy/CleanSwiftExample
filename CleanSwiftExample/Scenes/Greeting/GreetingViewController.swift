//
//  GreetingViewController.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

protocol GreetingDisplayLogic: AnyObject {
    func displayGreeting(viewModel: Greeting.Name.ViewModel)
}

class GreetingViewController: UIViewController, GreetingDisplayLogic {
    var interactor: GreetingBusinessLogic?
    var router: (GreetingRoutingLogic & NSObjectProtocol)?
    
    // MARK: - Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    
    // MARK: - Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupScene()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScene()
    }

    // MARK: - Setup scene

    private func setupScene() {
        let interactor = GreetingInteractor()
        let presenter = GreetingPresenter()
        let router = GreetingRouter()
        
        self.interactor = interactor
        self.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = self
        router.viewController = self
        
        router.dataStore = interactor
    }

    // MARK: - Routing

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: - Actions
    
    // MARK: - Selectors
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        getName()
    }

    // MARK: - Display methods

    func displayGreeting(viewModel: Greeting.Name.ViewModel) {
        userNameLabel.text = viewModel.userName
    }

    // MARK: - Requests

    func getName() {
        let request = Greeting.Name.Request()
        interactor?.getName(request: request)
    }
}
