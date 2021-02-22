//
//  SceneDelegate.swift
//  todo-list-app
//
//  Created by Ayokunle on 22/02/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let navigationBar = UINavigationController(rootViewController: TodoListViewController())
        navigationBar.navigationBar.barTintColor = #colorLiteral(red: 0.3098039216, green: 0.5333333333, blue: 0.568627451, alpha: 1)
        navigationBar.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont(name: "Apple SD Gothic Neo Bold", size: 20) as Any]
        window?.rootViewController = navigationBar
        window?.makeKeyAndVisible()
        
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

