//
//  HomeViewController.swift
//  KingBurguer
//
//  Created by Maria Eduarda Ferreira Alves on 28/10/25.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Atribui o delegate do viewModel a essa classe
    
    var viewModel: HomeViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
}
