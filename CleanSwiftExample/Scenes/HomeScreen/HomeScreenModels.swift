//
//  HomeScreenModels.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 02.01.2022.
//

import Foundation

enum HomeScreen {
    enum Home {
        struct Request {
        }
        
        struct Response {
            var userName: String?
        }
        
        struct ViewModel {
            var userName: String?
        }
    }
}
