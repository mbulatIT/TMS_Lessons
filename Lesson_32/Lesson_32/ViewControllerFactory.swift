//
//  ViewControllerFactory.swift
//  Lesson_32
//
//  Created by Maxim Bulat on 16.08.2021.
//

import Foundation
import UIKit

class ViewControllerFactory {
    static func createHomeViewController() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing:  HomeViewController.self)) as! HomeViewController
        let presenter = HomeViewPresenter(viewController: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
}
