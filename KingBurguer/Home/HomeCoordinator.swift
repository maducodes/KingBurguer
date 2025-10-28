//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Maria Eduarda Ferreira Alves on 28/10/25.
//

import Foundation
import UIKit

final class HomeCoordinator {
    
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinator = self
        homeViewController.viewModel = homeViewModel
        
        navigationController.pushViewController(homeViewController, animated: true)
        
        // Troca de navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
