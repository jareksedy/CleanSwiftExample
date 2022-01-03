//
//  NameInputModel.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

enum NameInput {
    enum Name {
        struct Request {
            var userName: String
        }

        struct Response {
            var userName: String
        }

        struct ViewModel {
            var userName: String
        }
    }
}
