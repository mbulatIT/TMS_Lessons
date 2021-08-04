//
//  ViewController.swift
//  Lesson_30
//
//  Created by Maxim Bulat on 04.08.2021.
//

import UIKit

class ViewController: UIViewController {
    var currentPerson: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clearButtonPressed(_ sender: Any) {
        currentPerson = nil
    }

    @IBAction func createButtonPressed(_ sender: Any) {
        let phoneNumber = PhoneNumber(number: "+375291275690")
        let person = Person(name: "Vlad", surname: "Test", phoneNumber: phoneNumber)
        phoneNumber.owner = person
        currentPerson = person
    }

    @IBAction func showNextControllerButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: RequestViewController.self))
        present(viewController, animated: true)
    }
}

