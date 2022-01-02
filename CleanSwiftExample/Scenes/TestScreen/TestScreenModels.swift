//
//  TestScreenModels.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 02.01.2022.
//

import Foundation

enum TestScreenModels {
  enum FetchUser {
    struct Request {
      let userName: String
    }
      
    struct Response {
      let userPhone: String
      let userEmail: String
    }
      
    struct ViewModel {
      let userPhone: String
      let userEmail: String
    }
  }
}
