//
//  GreetingInteractor.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

protocol GreetingBusinessLogic {
    func getName(request: Greeting.Name.Request)
}

protocol GreetingDataStore {
    var userName: String? { get set }
}

class GreetingInteractor: GreetingBusinessLogic, GreetingDataStore {
    var presenter: GreetingPresentationLogic?
    var userName: String?

    // MARK: - Do something

    func getName(request: Greeting.Name.Request) {
        let response = Greeting.Name.Response(userName: userName ?? "Unknown")
        presenter?.presentGreeting(response: response)
    }
}
