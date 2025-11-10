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
        textField.returnKeyType = .next
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemCyan
        textField.placeholder = "Entre com sua senha"
        textField.returnKeyType = .done
        textField.delegate = self
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Eventos de touch
    
    @objc private func handleTapButton() {
        viewModel?.send()
    }
    
    @objc private func handleTapRegister() {
        viewModel?.goToSignUp()
    }
    
    // MARK: Keyboard settings
    
    @objc private func dismissKeyboard(_ view: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
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

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.returnKeyType {
        case .done:
            view.endEditing(true)
            viewModel?.send()
        default:
            passwordTextField.becomeFirstResponder()
        }
        return false
    }
}
