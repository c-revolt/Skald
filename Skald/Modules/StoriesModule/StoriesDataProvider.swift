//
//  StoriesDataProvider.swift
//  Skald
//
//  Created by Александр Прайд on 04.02.2023.
//

import UIKit

enum StoriesSection: Int, CaseIterable {
    case story
}

final class StoriesDataProvider: NSObject {
    var storiesViewModel = StoriesViewModel()
    
}

extension StoriesDataProvider: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let viewModel = storiesViewModel
        viewModel.selectedRow(atIndexPath: indexPath)
        let detailView = DetailStoryViewController()
        detailView.present(detailView, animated: true)
    }
}

extension StoriesDataProvider: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return StoriesSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let viewModel = storiesViewModel
        return viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StoriesViewCell.reusedID,
            for: indexPath) as? StoriesViewCell else { return UICollectionViewCell() }
        
        let cellViewModel = storiesViewModel.storieCellViewModell(for: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    
}

