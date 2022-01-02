//
//  HomeScreenInteractor.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 02.01.2022.
//

import Foundation

protocol HomeScreenBusinessLogic {
    
}

protocol HomeScreenDataStore {
    
}

class HomeScreenInteractor: HomeScreenBusinessLogic, HomeScreenDataStore {
    var dataStore: HomeScreenDataStore?
    var presenter: HomeScreenPresentationLogic?
}
