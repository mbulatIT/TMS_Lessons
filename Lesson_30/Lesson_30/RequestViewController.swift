//
//  RequestViewController.swift
//  Lesson_30
//
//  Created by Maxim Bulat on 04.08.2021.
//

import UIKit

class RequestViewController: UIViewController {

    @IBOutlet weak var requestStatusLabel: UILabel!
    
    deinit {
        print("Request controller deinit")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeRequest()
    }
    
    func makeRequest() {
        let url = URL(string: "https://google.com")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.processData()
            }
        }.resume()
        requestStatusLabel.text = "Request sent"
    }
    
    func processData() {
        requestStatusLabel.text = "Request completed"
    }

    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
