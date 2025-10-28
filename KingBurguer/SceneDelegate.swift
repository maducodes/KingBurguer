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
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let signInCoordinator = SignInCoordinator(window: window)
        signInCoordinator.start()
    }
}
