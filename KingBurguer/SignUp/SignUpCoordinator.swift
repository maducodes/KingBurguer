//
//  SignUpCoordinator.swift
//  KingBurguer
//
//  Created by Maria Eduarda Ferreira Alves on 28/10/25.
//

import Foundation
import UIKit

final class SignUpCoordinator {
    
    private let navigationController: UINavigationController
    var parentCoordinator: SignInCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signInViewController = SignUpViewController()
        let signInViewModel = SignUpViewModel()
        signInViewModel.coordinator = self
        signInViewController.viewModel = signInViewModel
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    func home() {
        parentCoordinator?.home()
    }
}
