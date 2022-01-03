//
//  GreetingModel.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

enum Greeting {
    enum Name {
        struct Request {
        }

        struct Response {
            var userName: String
        }

        struct ViewModel {
            var userName: String
        }
    }
}
