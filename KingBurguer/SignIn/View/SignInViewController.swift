//
//  SignInViewController.swift
//  KingBurguer
//
//  Created by Maria Eduarda Ferreira Alves on 07/09/25.
//

import UIKit
import Foundation

final class SignInViewController: UIViewController {
    
    // MARK: - Atribui o delegate do viewModel a essa classe
    var viewModel: SignInViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemCyan
        textField.placeholder = "Entre com seu email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemCyan
        textField.placeholder = "Entre com sua senha"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Criar Conta", for: .normal)
        button.backgroundColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTapRegister), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.title = "Login"
    }
    
    // MARK: - Eventos de touch
    
    @objc private func handleTapButton() {
        viewModel?.send()
    }
    
    @objc private func handleTapRegister() {
        viewModel?.goToSignUp()
    }
    
    // MARK: - Layouts
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupViewHierarchy()
        setupContraints()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(registerButton)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

// MARK: - Observers
extension SignInViewController: SignInViewModelDelegate {
    func viewModelDidChanged(state: SignInState) {
        switch state {
        case .none:
            break
        case .loading:
            //mostrar progress
            break
        case .goToHome:
            viewModel?.goToHome()
            break
        case .error(let errorMessage):
            let alertViewController = UIAlertController(title: "titulo", message: errorMessage, preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "Fechar", style: .default))
            self.present(alertViewController, animated: true)
        }
    }
}
