//
//  SettingsViewController.swift
//  Skald
//
//  Created by Александр Прайд on 14.02.2023.
//

import UIKit

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
        
        view.backgroundColor = .green
    }
}

extension SettingsViewController: SettingsViewControllerProtocol {
    
}
