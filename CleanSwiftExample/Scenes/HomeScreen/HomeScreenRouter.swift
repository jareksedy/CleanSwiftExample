//
//  HomeScreenRouter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 02.01.2022.
//

import Foundation
import UIKit

protocol HomeScreenRoutingLogic {
    func routeToAuthScreen(segue: UIStoryboardSegue?)
}

protocol HomeScreenDataPassing {
    var dataStore: HomeScreenDataStore? { get }
}

class HomeScreenRouter: NSObject, HomeScreenRoutingLogic, HomeScreenDataPassing {
    var dataStore: HomeScreenDataStore?
    weak var viewController: HomeScreenViewController?
    
    func routeToAuthScreen(segue: UIStoryboardSegue?) {
    }
}
