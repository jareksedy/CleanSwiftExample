//
//  AuthScreenViewController.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import UIKit

protocol AuthScreenDisplayLogic {
    func displayAuth(viewModel: AuthScreen.Auth.ViewModel)
}

class AuthScreenViewController: UIViewController, AuthScreenDisplayLogic {
    @IBOutlet weak var passcodeCaptionLabel: UILabel!
    @IBOutlet weak var passcodeTextField: UITextField!
    @IBOutlet weak var proceedButton: UIButton!
    
    var interactor: AuthScreenBusinessLogic?
    var router: (NSObjectProtocol & AuthScreenRoutingLogic & AuthScreenDataPassing)?
    
    private func construct() {
        let viewController = self
        let interactor = AuthScreenInteractor()
        let presenter = AuthScreenPresenter()
        let router = AuthScreenRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func displayAuth(viewModel: AuthScreen.Auth.ViewModel) {
        if viewModel.success { performSegue(withIdentifier: "HomeScreen", sender: nil) } else { passcodeTextField.text = nil }
    }
    
    func authenticate() {
        let passcode = passcodeTextField.text
        let request = AuthScreen.Auth.Request(passcode: passcode)
        interactor?.authenticate(request: request)
    }
    
    @IBAction func proceedButtonTapped(_ sender: Any) {
        authenticate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        construct()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        construct()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        construct()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
}
