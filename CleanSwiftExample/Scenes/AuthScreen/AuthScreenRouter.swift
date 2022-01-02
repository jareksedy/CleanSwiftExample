//
//  AuthScreenRouter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import Foundation
import UIKit

@objc protocol AuthScreenRoutingLogic {
    func routeToHomeScreen(segue: UIStoryboardSegue?)
}

protocol AuthScreenDataPassing {
    var dataStore: AuthScreenDataStore? { get }
}

class AuthScreenRouter: NSObject, AuthScreenRoutingLogic, AuthScreenDataPassing {
    weak var viewController: AuthScreenViewController?
    var dataStore: AuthScreenDataStore?
    
    func routeToHomeScreen(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destination = segue.destination as! HomeScreenViewController
            var destinationDataStore = destination.router!.dataStore!
            
            passDataToHomeScreen(source: dataStore!, destination: &destinationDataStore)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destination = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            var destinationDataStore = destination.router!.dataStore!
            
            passDataToHomeScreen(source: dataStore!, destination: &destinationDataStore)
            navigateToHomeScreen(source: viewController!, destination: destination)
        }
    }
    
    func passDataToHomeScreen(source: AuthScreenDataStore, destination: inout HomeScreenDataStore) {
        destination.userName = source.userName
    }
    
    func navigateToHomeScreen(source: AuthScreenViewController, destination: HomeScreenViewController) {}
}
