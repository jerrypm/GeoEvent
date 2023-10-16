//
//  SceneDelegate.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else {
            return
        }

        let windows = UIWindow(windowScene: windowsScene)
        let controller = EventViewController()

        windows.rootViewController = UINavigationController(rootViewController: controller)
        self.window = windows
        windows.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
