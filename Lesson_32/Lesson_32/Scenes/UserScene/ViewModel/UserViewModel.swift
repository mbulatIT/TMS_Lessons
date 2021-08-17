//
//  UserViewModel.swift
//  Lesson_32
//
//  Created by Maxim Bulat on 16.08.2021.
//

import Foundation

protocol UserViewModel {
    var didUpdateName: ((String) -> ())? { get set }
    var didUpdateSurname: ((String) -> ())? { get set }
    func viewDidLoad()
}

class UserViewModelImplementation: UserViewModel {
    
    var didUpdateSurname: ((String) -> ())?
    var didUpdateName: ((String) -> ())?
    
    private var name: String? {
        didSet {
            if let name = name {
                self.didUpdateName?(name)
            }
        }
    }
    
    private var surname: String? {
        didSet {
            if let surname = surname {
                self.didUpdateSurname?(surname)
            }
        }
    }
    
    func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let userData = UserData(id: "1", name: "My Name", surname: "My Surname")
            self.name = userData.name
            self.surname = userData.surname
        }
    }
    
    
    weak var viewController: UserViewController?
    
    init(viewController: UserViewController) {
        self.viewController = viewController
    }
}
