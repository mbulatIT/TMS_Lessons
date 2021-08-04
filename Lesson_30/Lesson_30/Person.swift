//
//  Person.swift
//  Lesson_30
//
//  Created by Maxim Bulat on 04.08.2021.
//

import Foundation

class Person {
    var name: String
    var surname: String
    var phoneNumber: PhoneNumber
    
    init(name: String, surname: String, phoneNumber: PhoneNumber) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        print("I \(name) \(surname) initialized")
    }
    
    deinit {
        print("I \(name) \(surname) will be removed from memory")
    }
}
