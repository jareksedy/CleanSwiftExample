//
//  AuthScreenRouter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import Foundation
import UIKit

protocol AuthScreenRoutingLogic {
    func routeToHome(segue: UIStoryboardSegue?)
}

protocol AuthScreenDataPassing {
    var dataStore: AuthScreenDataStore? { get }
}

class AuthScreenRouter: AuthScreenRoutingLogic, AuthScreenDataPassing {
    var dataStore: AuthScreenDataStore?
    var viewController: AuthScreenViewController?
    
    func routeToHome(segue: UIStoryboardSegue?) {
        guard let segue = segue else { return }
        
        let destination = segue.destination as! HomeScreenViewController
        //var destinationDataStore = destination.router!.dataStore!
    }
}
