//
//  SettingsViewController.swift
//  Skald
//
//  Created by Александр Прайд on 14.02.2023.
//

import UIKit
import ViewAnimator

protocol SettingsViewControllerProtocol: AnyObject {
    
}

class SettingsViewController: UIViewController {
    
    private let viewModel: SettingsViewModelProtocol
    
    init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = .systemGray6
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animation = AnimationType.from(direction: .top, offset: 300)
        
        UIView.animate(views: view.subviews,
                       animations: [animation],
                       duration: 2)
    }
}

extension SettingsViewController: SettingsViewControllerProtocol {
    
}
