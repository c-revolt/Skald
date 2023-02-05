//
//  RunesViewCellModel.swift
//  Skald
//
//  Created by Александр Прайд on 05.02.2023.
//

import UIKit

protocol RunesViewCellViewModelProtocol: AnyObject {
   
    var titleString: String { get }
    
}

final class RunesViewCellViewModel {
    
    private let runes: Rune?
    
    init(runes: Rune? = nil) {
        self.runes = runes
    }
}

extension RunesViewCellViewModel: RunesViewCellViewModelProtocol {
    
    var titleString: String {
        guard let runes = runes else { return "Unknown Error" }
        return runes.runeTitle ?? ""
    }
    
}
