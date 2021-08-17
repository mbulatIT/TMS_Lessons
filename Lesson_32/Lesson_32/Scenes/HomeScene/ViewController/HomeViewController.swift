//
//  HomeViewController.swift
//  Lesson_32
//
//  Created by Maxim Bulat on 16.08.2021.
//

import UIKit

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    var presenter: HomeViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    @IBAction func bottomButtonDidPressed(_ sender: Any) {
        self.presenter.bottomButtonDidPressed()
    }
    
    func update(with newText: String) {
        
    }
}
