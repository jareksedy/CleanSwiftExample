//
//  TestTemplateViewController.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

protocol TestTemplateDisplayLogic: AnyObject {
    func displaySomething(viewModel: TestTemplate.Something.ViewModel)
}

class TestTemplateViewController: UIViewController, TestTemplateDisplayLogic {
    @IBOutlet weak var testLabel: UILabel!
    
    var interactor: TestTemplateBusinessLogic?
    var router: (NSObjectProtocol & TestTemplateRoutingLogic & TestTemplateDataPassing)?

    // MARK: - Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupScene()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScene()
    }

    // MARK: - Setup

    private func setupScene() {
        let viewController = self
        let interactor = TestTemplateInteractor()
        let presenter = TestTemplatePresenter()
        let router = TestTemplateRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
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

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: - Display Logic

    func displaySomething(viewModel: TestTemplate.Something.ViewModel) {
        testLabel.text = """
User: \(viewModel.userName)
Email: \(viewModel.userEmail)
Phone: \(viewModel.userPhoneNo)
"""
    }

    // MARK: - Private

    func doSomething() {
        let request = TestTemplate.Something.Request()
        interactor?.doSomething(request: request)
    }
}
