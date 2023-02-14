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
        window.overrideUserInterfaceStyle = .dark
    }
}

// MARK: StoriesOutput
extension Coordinator: StoriesOutput {
    func showDetails(_ story: Story) {
        let detailsView = assembly.makeDetails(output: self, story: story)
        navigationController?.pushViewController(detailsView, animated: true)
    }
    
    func showSettingsViewController() {
        let settingsVC = assembly.makeSettings(output: self)
        //navigationController?.pushViewController(settingsVC, animated: true)
        navigationController?.present(settingsVC, animated: true)
    }
}

extension Coordinator: DetailStoryOutput {
    
}

extension Coordinator: SettingsOutput {
    
}



