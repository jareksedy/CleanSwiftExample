//
//  GreetingRouter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

typealias GreetingRoutingLogic = GreetingNavigationLogic & GreetingDataPassing

@objc protocol GreetingNavigationLogic {
    // func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol GreetingDataPassing {
    var dataStore: GreetingDataStore? { get }
}

class GreetingRouter: NSObject, GreetingRoutingLogic {
    weak var viewController: GreetingViewController?
    var dataStore: GreetingDataStore?

    // MARK: - Routing

    func routeToSomewhere(segue: UIStoryboardSegue?) {
//        if let segue = segue {
//            let destinationViewController = segue.destination as! SomewhereViewController
//            var destinationDataStore = destinationViewController.router!.dataStore!
//            passDataToSomewhere(source: dataStore!, destination: &destinationDataStore)
//        } else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
//            var destinationDataStore = destinationViewController.router!.dataStore!
//            passDataToSomewhere(source: dataStore!, destination: &destinationDataStore)
//            navigateToSomewhere(source: viewController!, destination: destinationViewController)
//        }
    }

    // MARK: - Navigation

//    func navigateToSomewhere(source: GreetingViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    // MARK: - Passing data

//    func passDataToSomewhere(source: GreetingDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
