//
//  SignUpViewController.swift
//  KingBurguer
//
//  Created by Maria Eduarda Ferreira Alves on 27/10/25.
//

import Foundation
import UIKit

final class SignUpViewController: UIViewController {

    // MARK: - Atribui o delegate do viewModel a essa classe
    var viewModel: SignUpViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemCyan
        textField.placeholder = "Entre com seu nome"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
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
    
    private lazy var cpfTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemCyan
        textField.placeholder = "Entre com seu CPF"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemCyan
        textField.placeholder = "Entre com sua data de nascimento"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTapButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cadastro"
        setupUI()
    }
    
    // MARK: - Eventos de touch
    
    @objc private func handleTapButton() {
        viewModel?.send()
    }
    
    // MARK: - Layouts
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupViewHierarchy()
        setupContraints()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(cpfTextField)
        view.addSubview(birthdayTextField)
        view.addSubview(signUpButton)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            cpfTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cpfTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cpfTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            cpfTextField.heightAnchor.constraint(equalToConstant: 50),
            
            birthdayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            birthdayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            birthdayTextField.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: 10),
            birthdayTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButton.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 10),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension SignUpViewController: SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState) {
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
