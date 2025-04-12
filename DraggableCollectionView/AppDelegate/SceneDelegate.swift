//
//  SceneDelegate.swift
//  DraggableCollectionView
//
//  Created by Phil Wright on 4/5/25.
//

import UIKit

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Tab Bar Controller as the root
        let tabBarController = UITabBarController()

        // Create instances of view controllers
    
        let layout = UICollectionViewFlowLayout()
        let mainVC = ReorderableCollectionView(collectionViewLayout: layout)
        
        
        mainVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)

        let gameVC = GameViewController() // Game
        gameVC.tabBarItem = UITabBarItem(title: "Game", image: UIImage(systemName: "gamecontroller"), tag: 1)

        let instructVC = InstructViewController() // Instructions
        instructVC.tabBarItem = UITabBarItem(title: "Instructions", image: UIImage(systemName: "book"), tag: 2)

        let swipingVC = SwipingViewController() // Swiping
        swipingVC.tabBarItem = UITabBarItem(title: "Swiping", image: UIImage(systemName: "hand.point.right"), tag: 3)

        // Embed in navigation controllers
        let mainNav = UINavigationController(rootViewController: mainVC)
        let gameNav = UINavigationController(rootViewController: gameVC)
        let instructNav = UINavigationController(rootViewController: instructVC)
        let swipingNav = UINavigationController(rootViewController: swipingVC)

        // Add view controllers to tab bar
        tabBarController.viewControllers = [mainNav, gameNav, instructNav, swipingNav]

        // Setup the window
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
