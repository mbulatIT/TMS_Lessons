//
//  UserViewController.swift
//  Lesson_32
//
//  Created by Maxim Bulat on 16.08.2021.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!

    var viewModel: UserViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.didUpdateName = { name in
            self.nameLabel.text = name
        }
        
        viewModel?.didUpdateSurname = { surname in
            self.surnameLabel.text = surname
        }
        
        viewModel?.viewDidLoad()
    }

}
