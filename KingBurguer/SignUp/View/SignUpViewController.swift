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
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
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
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyboardNotification),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyboardNotification),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
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
    
    // MARK: Keyboard settings (hide/show and add margin in ScrollView)
    
    @objc private func dismissKeyboard(_ view: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @objc private func onKeyboardNotification(_ notification: Notification) {
        let isVisible = notification.name == UIResponder.keyboardWillShowNotification
        let keyboardFrame = isVisible ? UIResponder.keyboardFrameEndUserInfoKey : UIResponder.keyboardFrameBeginUserInfoKey
        
        if let keyboardSize = (notification.userInfo?[keyboardFrame] as? NSValue)?.cgRectValue {
            onKeyboardChanged(isVisible, height: keyboardSize.height)
        }
    }
    
    func onKeyboardChanged(_ isVisible: Bool, height: CGFloat) {
        if !isVisible {
            scrollView.contentInset = .zero
            scrollView.scrollIndicatorInsets = .zero
        } else {
            let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: height, right: 0.0)
            scrollView.contentInset = contentInset
            scrollView.scrollIndicatorInsets = contentInset
        }
    }
    
    // MARK: - Layouts
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupViewHierarchy()
        setupContraints()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(cpfTextField)
        scrollView.addSubview(birthdayTextField)
        scrollView.addSubview(signUpButton)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            nameTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            nameTextField.heightAnchor.constraint(equalToConstant: 100),
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            emailTextField.heightAnchor.constraint(equalToConstant: 100),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 100),
            
            cpfTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            cpfTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            cpfTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            cpfTextField.heightAnchor.constraint(equalToConstant: 100),
            
            birthdayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            birthdayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            birthdayTextField.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: 10),
            birthdayTextField.heightAnchor.constraint(equalToConstant: 100),
            
            signUpButton.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 10),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            signUpButton.heightAnchor.constraint(equalToConstant: 100),
            signUpButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50)
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
