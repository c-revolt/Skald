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
    var runesViewModel = RunesViewModel()
}

extension RunesDataProvider: UICollectionViewDelegate {
    
}

extension RunesDataProvider: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return RunesSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let viewModel = runesViewModel
        return viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RunesViewCell.reusedID,
            for: indexPath
        ) as? RunesViewCell else
        { return UICollectionViewCell() }
        
        let cellViewModel = runesViewModel.runeCellViewModell(for: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
    
}


