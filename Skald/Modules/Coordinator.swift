//
//  Coordinator.swift
//  Skald
//
//  Created by Александр Прайд on 21.12.2022.
//

import UIKit

class Coordinator {
    
    private let assembly: Assembly
    private var tabBarController = UITabBarController()
    
    init(assembly: Assembly) {
        self.assembly = assembly
    }
    
    func start(window: UIWindow) {
        //let storiesVC = assembly.makeStories(output: self)
        tabBarController.setViewControllers(
            [
                UINavigationController(rootViewController: assembly.makeStories(output: self)),
                UINavigationController(rootViewController: assembly.makeRunes(output: self)),
                UINavigationController(rootViewController: UIViewController()),
                UINavigationController(rootViewController: UIViewController()),
                
            ],
            animated: true
        )
        
        setupTabBarController()
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        window.overrideUserInterfaceStyle = .dark
    }
    
    private func setupTabBarController() {
        tabBarController.viewControllers?[0].tabBarItem = UITabBarItem(title: K.TabBarTitles.stories,
                                                                       image: UIImage(systemName: K.TabBarTitles.storiesIcon),
                                                                       tag: 0)
        tabBarController.viewControllers?[1].tabBarItem = UITabBarItem(title: K.TabBarTitles.runes,
                                                                       image: UIImage(systemName: K.TabBarTitles.runesIcon),
                                                                       tag: 1)
        tabBarController.viewControllers?[2].tabBarItem = UITabBarItem(title: K.TabBarTitles.gallery,
                                                                       image: UIImage(systemName: K.TabBarTitles.galleryIcon),
                                                                       tag: 2)
        tabBarController.viewControllers?[3].tabBarItem = UITabBarItem(title: K.TabBarTitles.settings,
                                                                       image: UIImage(systemName: K.TabBarTitles.settingsIcon),
                                                                       tag: 3)
        
        //tabBarController.tabBar.tintColor = #colorLiteral(red: 0.4051911831, green: 0.8323276639, blue: 0.628583014, alpha: 1)
        tabBarController.tabBar.tintColor = .white
        
    }
    
}

// MARK: StoriesOutput
extension Coordinator: StoriesOutput {

}

extension Coordinator: RunesOutput {
    
}
