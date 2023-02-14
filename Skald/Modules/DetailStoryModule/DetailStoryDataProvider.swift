//
//  DetailStoryDataProvider.swift
//  Skald
//
//  Created by Александр Прайд on 09.02.2023.
//

import UIKit

enum DetailStorySection: Int, CaseIterable {
    case header
    case content
}

final class DetailStoryDataProvider: NSObject {
    var detailStoryViewModel = DetailStoryViewModel()
}

extension DetailStoryDataProvider: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension DetailStoryDataProvider: UICollectionViewDelegate {
    
}



