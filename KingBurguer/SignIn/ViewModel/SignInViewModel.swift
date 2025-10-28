//
//  SignInViewModel.swift
//  KingBurguer
//
//  Created by Maria Eduarda Ferreira Alves on 23/10/25.
//

import Foundation

protocol SignInViewModelDelegate {
    func viewModelDidChanged(state: SignInState)
}

final class SignInViewModel {
    
    var delegate: SignInViewModelDelegate?
    
    var state: SignInState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send() {
        state = .loading
        
        // Simula latencia de rede
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .error("Usuario nao existe")
        }
    }
}
