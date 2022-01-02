//
//  HomeScreenInteractor.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 02.01.2022.
//

import Foundation

protocol HomeScreenBusinessLogic {
    func fetchUserName()
}

protocol HomeScreenDataStore {
    var userName: String? { get set }
}

class HomeScreenInteractor: HomeScreenBusinessLogic, HomeScreenDataStore {
    var dataStore: HomeScreenDataStore?
    var presenter: HomeScreenPresentationLogic?
    var userName: String?
    
    func fetchUserName() {        
        let response = HomeScreen.Home.Response(userName: userName)
        presenter?.presentGreeting(response: response)
    }
}
