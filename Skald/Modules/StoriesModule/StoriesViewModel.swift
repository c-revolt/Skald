//
//  StoriesViewModel.swift
//  Skald
//
//  Created by Александр Прайд on 21.12.2022.
//

import Foundation

// MARK: StoriesViewModelProtocol
protocol StoriesViewModelProtocol: AnyObject {
    
}

// MARK: StoriesViewModel
final class StoriesViewModel {
    
    weak var view: StoriesViewControllerProtocol?
    private weak var output: StoriesOutput?
    
    init(output: StoriesOutput) {
        self.output = output
    }
    
}

// MARK: StoriesViewModelProtocol
extension StoriesViewModel: StoriesViewModelProtocol {
    
}
