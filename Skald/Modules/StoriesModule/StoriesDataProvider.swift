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
    var storiesViewModel: StoriesViewModelProtocol?
    //let storiesFromJSON = Bundle.main.decode([Story].self, from: "storiesData.json")
}

extension StoriesDataProvider: UICollectionViewDelegate {
    
}

extension StoriesDataProvider: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return StoriesSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = storiesViewModel else { return 0 }
        return viewModel.stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = storiesViewModel?.storiesFromJSON[indexPath.row] else { fatalError() }
        //let stories = storiesFromJSON[indexPath.item]

        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StoriesViewCell.reusedID,
            for: indexPath) as? StoriesViewCell else { return UICollectionViewCell() }
        print(viewModel)
        cell.update(with: viewModel)
        
        return cell
    }
    
    
}

