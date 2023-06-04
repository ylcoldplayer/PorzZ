//
//  SceneDelegate.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/13/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
//        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .black
//        UINavigationBar.appearance().backgroundColor = .black
//
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white
        
        
        let tabBarController = UITabBarController()
        
        let navigationController = UINavigationController(rootViewController: tabBarController)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)

        
        let porzzActivityViewController = PorzzActivityViewController()
        porzzActivityViewController.tabBarItem = UITabBarItem(title: "Activities", image: UIImage(systemName: "list.bullet"), tag: 2)
        

        let porzzMainViewController = PorzzMainViewController()
        porzzMainViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
                

        let porzzSearchViewController = PorzzSearchViewController()
//        porzzSearchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        let porzzSearchNC = UINavigationController(rootViewController: porzzSearchViewController)
        porzzSearchNC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)

        tabBarController.viewControllers = [porzzMainViewController, porzzSearchNC, porzzActivityViewController]
        
        
//        tabBarController.tabBar.shadowImage = UIImage()
//        tabBarController.tabBar.backgroundImage = UIImage()
        tabBarController.tabBar.barTintColor = .black

        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

