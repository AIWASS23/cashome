//
//  SceneDelegate.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 25/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {

            guard let windowScene = (scene as? UIWindowScene) else { return }

            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UINavigationController(rootViewController: ViewController())
            self.window = window
            window.makeKeyAndVisible()
            window.overrideUserInterfaceStyle = .light
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
