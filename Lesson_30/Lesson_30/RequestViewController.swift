//
//  RequestViewController.swift
//  Lesson_30
//
//  Created by Maxim Bulat on 04.08.2021.
//

import UIKit

class RequestViewController: UIViewController {

    @IBOutlet weak var requestStatusLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    deinit {
        print("Request controller deinit")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeRequest()
    }
    
    func makeRequest() {
        let url = URL(string: "https://google.com")!
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self?.processData()
            }
        }.resume()
        requestStatusLabel.text = "Request sent"
    }
    
    func processData() {
        requestStatusLabel.text = "Request completed"
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        if let password = passwordTextField.text,
           password.isEmpty == false {
            KeychainManager.shared.savePassword(password)
        }
    }

    @IBAction func validateButtonPressed(_ sender: Any) {
        if let password = passwordTextField.text,
           password.isEmpty == false {
            if KeychainManager.shared.validatePassword(password) {
                requestStatusLabel.text = "Validation pass"
            } else {
                requestStatusLabel.text = "Validation failed"
            }
        }
    }

    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
