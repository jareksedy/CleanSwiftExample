//
//  Authenticator.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import Foundation

final class Authenticator {
    private let passcodesWithUserNames = [
        "1234": "William Blake",
        "4359": "Charles Bukowski",
        "8848": "Stephen King",
        "9766": "Howard Lovecraft"
    ]
    
    func authenticate(with passcode: String) -> (Bool, String?) {
        return (passcodesWithUserNames[passcode] != nil, passcodesWithUserNames[passcode])
    }
}
