//
//  AuthScreenModels.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import Foundation

enum AuthScreen {
    enum Auth {
        struct Request {
            var passcode: String?
        }
        
        struct Response {
            var success: Bool
            var userName: String?
        }
        
        struct ViewModel {
            var success: Bool
            var userName: String?
        }
    }
}
