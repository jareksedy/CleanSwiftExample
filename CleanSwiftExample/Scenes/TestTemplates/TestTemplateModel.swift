//
//  TestTemplateModel.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

enum TestTemplate {
    enum Something {
        struct Request {
            
        }

        struct Response {
            var userName: String
            var userEmail: String
            var userPhoneNo: String
        }

        struct ViewModel {
            var userName: String
            var userEmail: String
            var userPhoneNo: String
        }
    }
}
