//
//  StoriesViewModel.swift
//  Skald
//
//  Created by Александр Прайд on 21.12.2022.
//

import Foundation

// MARK: StoriesViewModelProtocol
protocol StoriesViewModelProtocol: AnyObject {

    var stories: [Story] { get }
    var storiesFromJSON: [Story] { get }
    init(view: StoriesViewControllerProtocol?, output: StoriesOutput?)
    func numberOfRows() -> Int
    func storieCellViewModell(for indexPath: IndexPath) -> StoriesViewCellViewModelProtocol?
    
}

// MARK: StoriesViewModel
final class StoriesViewModel {
    
    weak var view: StoriesViewControllerProtocol?
    private weak var output: StoriesOutput?
    private(set)var stories: [Story] = []
    let storiesFromJSON = Bundle.main.decode([Story].self, from: "storiesData.json")
    
    
    init(view: StoriesViewControllerProtocol? = nil, output: StoriesOutput? = nil) {
        self.view = view
        self.output = output
    }
    
}

// MARK: StoriesViewModelProtocol
extension StoriesViewModel: StoriesViewModelProtocol {
    
    
    func numberOfRows() -> Int {
        let stories = storiesFromJSON
        return stories.count
    }

    func storieCellViewModell(for indexPath: IndexPath) -> StoriesViewCellViewModelProtocol? {
        let stories = storiesFromJSON[indexPath.row]
        return StoriesViewCellViewModel(stories: stories)
    }
}
