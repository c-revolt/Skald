//
//  RunesDataProvider.swift
//  Skald
//
//  Created by Александр Прайд on 04.02.2023.
//

import UIKit

enum RunesSection: Int, CaseIterable {
    case rune
}

final class RunesDataProvider: NSObject {
    var runesViewModel: RunesViewModelProtocol?
    //let storiesFromJSON = Bundle.main.decode([Story].self, from: "storiesData.json")
}

extension RunesDataProvider: UICollectionViewDelegate {
    
}

extension RunesDataProvider: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return RunesSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = runesViewModel?.runesFromJSON else { return 0 }
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let model = runesViewModel?.runes[indexPath.row] else { fatalError() }

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RunesViewCell.reusedID,
            for: indexPath) as? RunesViewCell else { return UICollectionViewCell() }
        print(model)
        cell.update(with: Rune(runeTitle: model.runeTitle, runeImage: nil, runeEttir: nil, runeMeaning: nil, runeDescription: nil))
        
        return cell
    }
    
    
}


