//
//  Authenticator.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import Foundation

final class Authenticator {
    private let passcodes = ["1234", "4359", "8888", "9761"]
    
    func authenticate(with passcode: String) -> Bool {
        return passcodes.contains(passcode)
    }
}
