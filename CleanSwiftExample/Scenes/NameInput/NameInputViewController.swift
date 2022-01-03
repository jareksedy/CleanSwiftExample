//
//  NameInputViewController.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

protocol NameInputDisplayLogic: AnyObject {
    func proceedToNextScreen(viewModel: NameInput.Name.ViewModel)
}

class NameInputViewController: UIViewController, NameInputDisplayLogic {
    var interactor: NameInputBusinessLogic?
    var router: (NameInputRoutingLogic & NSObjectProtocol)?
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var proceedButton: UIButton!
    
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
        let interactor = NameInputInteractor()
        let presenter = NameInputPresenter()
        let router = NameInputRouter()
        
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
    @IBAction func proceedButtonTapped(_ sender: Any) {
        guard nameTextField.text != "" else { return }
        proceedWithName(name: nameTextField.text!)
    }
    
    // MARK: - Selectors
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Display methods
    
    func proceedToNextScreen(viewModel: NameInput.Name.ViewModel) {
        performSegue(withIdentifier: "Greeting", sender: nil)
    }

    // MARK: - Requests

    func proceedWithName(name: String) {
        let request = NameInput.Name.Request(userName: name)
        interactor?.proceed(request: request)
    }
}
