//
//  SettingsViewModel.swift
//  Skald
//
//  Created by Александр Прайд on 14.02.2023.
//

import Foundation

protocol SettingsViewModelProtocol: AnyObject {
    
}

final class SettingsViewModel {
    
    weak var view: SettingsViewControllerProtocol?
    weak var optput: SettingsOutput?
    
    init(view: SettingsViewControllerProtocol? = nil, optput: SettingsOutput? = nil) {
        self.view = view
        self.optput = optput
    }
    
}

extension SettingsViewModel: SettingsViewModelProtocol {
    
}
