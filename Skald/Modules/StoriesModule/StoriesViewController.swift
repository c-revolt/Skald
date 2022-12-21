//
//  ViewController.swift
//  Skald
//
//  Created by Александр Прайд on 21.12.2022.
//

import UIKit

// MARK: StoriesViewControllerProtocol
protocol StoriesViewControllerProtocol: AnyObject {
    
}

// MARK: StoriesViewController
class StoriesViewController: UIViewController {

    private weak var viewModel: StoriesViewModelProtocol?
    
    init(viewModel: StoriesViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: StoriesViewControllerProtocol
extension StoriesViewController: StoriesViewControllerProtocol {
    
}
