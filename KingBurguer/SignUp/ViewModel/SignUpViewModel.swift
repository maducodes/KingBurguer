//
//  SignUpViewModel.swift
//  KingBurguer
//
//  Created by Maria Eduarda Ferreira Alves on 28/10/25.
//

import Foundation

protocol SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState)
}

final class SignUpViewModel {
    var delegate: SignUpViewModelDelegate?
    var coordinator: SignUpCoordinator?
    
    var state: SignUpState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send() {
        state = .loading
        
        // Simula latencia de rede
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .error("Erro interno no servidor")
        }
    }
}
