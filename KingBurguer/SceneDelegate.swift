//
//  SceneDelegate.swift
//  KingBurguer
//
//  Created by Maria Eduarda Ferreira Alves on 07/09/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let signInViewController = SignInViewController()
        let signInViewModel = SignInViewModel()
        signInViewController.viewModel = signInViewModel
        
        let navigationViewController = UINavigationController(rootViewController: signInViewController)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.rootViewController = navigationViewController
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
}
