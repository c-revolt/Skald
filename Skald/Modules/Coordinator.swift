//
//  Coordinator.swift
//  Skald
//
//  Created by Александр Прайд on 21.12.2022.
//

import UIKit

class Coordinator {
    
    private let assembly: Assembly
    private var navigationController: UINavigationController?
    
    init(assembly: Assembly) {
        self.assembly = assembly
    }
    
    func start(window: UIWindow) {
        let storiesView = assembly.makeStories(output: self)
        navigationController = UINavigationController(rootViewController: storiesView)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

// MARK: StoriesOutput
extension Coordinator: StoriesOutput {
    
}
