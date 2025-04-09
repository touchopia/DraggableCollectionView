//
//  SceneDelegate.swift
//  DraggableCollectionView
//
//  Created by Phil Wright on 4/5/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let layout = UICollectionViewFlowLayout()
        let collectionVC = ReorderableCollectionView(collectionViewLayout: layout)
        let navigationController = UINavigationController(rootViewController: collectionVC)
        navigationController.pushViewController(SwipingViewController(), animated: false)
        
        navigationController.pushViewController(InstructViewController(), animated: false)
        
        navigationController.pushViewController(ViewController(), animated: false)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

