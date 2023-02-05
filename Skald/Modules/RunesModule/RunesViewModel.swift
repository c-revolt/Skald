//
//  RunesViewModel.swift
//  Skald
//
//  Created by Александр Прайд on 04.02.2023.
//

import Foundation

// MARK: StoriesViewModelProtocol
protocol RunesViewModelProtocol: AnyObject {

    var runes: [Rune] { get }
    var runesFromJSON: [Rune] { get }
    
    init(view: RunesViewControllerProtocol?, output: RunesOutput?)
    func numberOfRows() -> Int
    func runeCellViewModell(for indexPath: IndexPath) -> RunesViewCellViewModelProtocol?
   
    
}

// MARK: StoriesViewModel
final class RunesViewModel {
    
    weak var view: RunesViewControllerProtocol?
    private weak var output: RunesOutput?
    private(set)var runes: [Rune] = []
    let runesFromJSON = Bundle.main.decode([Rune].self, from: "runesData.json")
    
    init(view: RunesViewControllerProtocol? = nil, output: RunesOutput? = nil) {
        self.view = view
        self.output = output
    }
    
}

// MARK: StoriesViewModelProtocol
extension RunesViewModel: RunesViewModelProtocol {
    
    func numberOfRows() -> Int {
        var runes = runesFromJSON
        return runes.count
    }

    func runeCellViewModell(for indexPath: IndexPath) -> RunesViewCellViewModelProtocol? {
        let runes = runesFromJSON[indexPath.row]
        return RunesViewCellViewModel(runes: runes)
    }

    
}
