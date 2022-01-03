//
//  NameInputRouter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

typealias NameInputRoutingLogic = NameInputNavigationLogic & NameInputDataPassing

@objc protocol NameInputNavigationLogic {
    func routeToGreeting(segue: UIStoryboardSegue?)
}

protocol NameInputDataPassing {
    var dataStore: NameInputDataStore? { get }
}

class NameInputRouter: NSObject, NameInputRoutingLogic {
    weak var viewController: NameInputViewController?
    var dataStore: NameInputDataStore?
    
    // MARK: - Routing
    
    func routeToGreeting(segue: UIStoryboardSegue?) {
                if let segue = segue {
                    let destinationViewController = segue.destination as! GreetingViewController
                    var destinationDataStore = destinationViewController.router!.dataStore!
                    passDataToGreeting(source: dataStore!, destination: &destinationDataStore)
                } else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! GreetingViewController
                    var destinationDataStore = destinationViewController.router!.dataStore!
                    passDataToGreeting(source: dataStore!, destination: &destinationDataStore)
                    navigateToGreeting(source: viewController!, destination: destinationViewController)
                }
    }
    
    // MARK: - Navigation
    
        func navigateToGreeting(source: NameInputViewController, destination: GreetingViewController) {
            source.show(destination, sender: nil)
        }
    
    // MARK: - Passing data
    
        func passDataToGreeting(source: NameInputDataStore, destination: inout GreetingDataStore) {
            destination.userName = source.userName
        }
}
