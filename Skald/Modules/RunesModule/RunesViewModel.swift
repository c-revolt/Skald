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
    init(view: RunesViewControllerProtocol?, output: RunesOutput?)
    func rune(at index: Int) -> Rune
    var runesFromJSON: [Rune] { get }
    
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
    
    func loadData() {
        
    
    }

    func rune(at index: Int) -> Rune {
        runes += runesFromJSON
        return runes[index]
    }
}
