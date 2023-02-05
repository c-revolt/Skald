//
//  RunesViewCellModel.swift
//  Skald
//
//  Created by Александр Прайд on 05.02.2023.
//

import UIKit

protocol RunesViewCellViewModelProtocol: AnyObject {
   
    var titleString: String? { get }
    var imageString: String? { get }
    var ettirString: String? { get }
    var meaningString: String? { get}
    var overviewString: String? { get }
    
}

final class RunesViewCellViewModel {
    
    private let runes: Rune?
    
    init(runes: Rune? = nil) {
        self.runes = runes
    }
}

extension RunesViewCellViewModel: RunesViewCellViewModelProtocol {
    var overviewString: String? {
        guard let runes = runes else { return "Unknown Error" }
        return runes.runeDescription
    }
    
    
    var titleString: String? {
        guard let runes = runes else { return "Unknown Error" }
        return runes.runeTitle
    }
    
    var imageString: String? {
        guard let runes = runes else { return "Unknown Error" }
        return runes.runeImage
    }
    
    var ettirString: String? {
        guard let runes = runes else { return "Unknown Error" }
        return runes.runeEttir
    }
    
    var meaningString: String? {
        guard let runes = runes else { return "Unknown Error" }
        return runes.runeMeaning
    }
    
    
    
}
