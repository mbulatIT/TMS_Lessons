//
//  HomeViewPresenter.swift
//  Lesson_32
//
//  Created by Maxim Bulat on 16.08.2021.
//

import Foundation

class HomeViewPresenter: HomeViewPresenterProtocol {
    
    weak var viewController: HomeViewControllerProtocol?
    
    init(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        // Делаем запрос в сеть
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let homeViewModel = HomeViewModel(newText: "Empty text")
            self.viewController?.update(with: homeViewModel.newText)
        }
    }
    
    func bottomButtonDidPressed() {
        // Обновление данных
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let homeViewModel = HomeViewModel(newText: "Empty text")
            self.viewController?.update(with: homeViewModel.newText)
        }
    }
}
