//
//  KeychainManager.swift
//  Lesson_30
//
//  Created by Maxim Bulat on 04.08.2021.
//

import Foundation
import SwiftyKeychainKit

class KeychainManager {

    static let shared = KeychainManager()
    
    private lazy var keychain = Keychain(service: "com.mbulat.www.Lesson-30")
    private let passwordKey = KeychainKey<String>(key: "_password")

    private init() { }
    
    func validatePassword(_ password: String) -> Bool {
        do {
            let storedPassword = try keychain.get(passwordKey)
            return password == storedPassword
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func savePassword(_ password: String) {
        do {
            try keychain.set(password, for: passwordKey)
            print("Password was successfully saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func clear() {
        do {
            try keychain.removeAll()
        } catch {
            print(error.localizedDescription)
        }
    }
}
