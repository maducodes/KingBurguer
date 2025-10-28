//
//  HomeViewModel.swift
//  KingBurguer
//
//  Created by Maria Eduarda Ferreira Alves on 28/10/25.
//

import Foundation

protocol HomeViewModelDelegate {
//    func viewModelDidChanged(state: HomeState)
}

final class HomeViewModel {
    var delegate: HomeViewModelDelegate?
    var coordinator: HomeCoordinator?
    
//    var state: HomeState = .none {
//        didSet {
//            delegate?.viewModelDidChanged(state: state)
//        }
//    }
}
