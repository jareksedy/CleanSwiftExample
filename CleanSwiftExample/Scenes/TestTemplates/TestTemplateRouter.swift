//
//  TestTemplateRouter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

typealias TestTemplateRoutingLogic = TestTemplateNavigationLogic & TestTemplateDataPassing

@objc protocol TestTemplateNavigationLogic {
    // func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol TestTemplateDataPassing {
    var dataStore: TestTemplateDataStore? { get }
}

class TestTemplateRouter: NSObject, TestTemplateRoutingLogic {
    weak var viewController: TestTemplateViewController?
    var dataStore: TestTemplateDataStore?

    // MARK: - Routing

    func routeToSomewhere(segue: UIStoryboardSegue?) {
//        if let segue = segue {
//            let destinationVC = segue.destination as! SomewhereViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//        } else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//            navigateToSomewhere(source: viewController!, destination: destinationVC)
//        }
    }

    // MARK: - Navigation

//    func navigateToSomewhere(source: TestTemplateViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    // MARK: - Passing data

//    func passDataToSomewhere(source: TestTemplateDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
