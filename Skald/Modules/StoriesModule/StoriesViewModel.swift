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
class StoriesViewModel {
    
    private weak var view: StoriesViewModelProtocol?
    
}

// MARK: StoriesViewModelProtocol
extension StoriesViewModel: StoriesViewModelProtocol {
    
}
