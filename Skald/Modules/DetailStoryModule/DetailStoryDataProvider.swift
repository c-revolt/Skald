//
//  DetailStoryDataProvider.swift
//  Skald
//
//  Created by Александр Прайд on 09.02.2023.
//

import Foundation

enum DetailStorySection: Int, CaseIterable {
    case image
    case rune
    case content
}

final class DetailStoryDataProvider: NSObject {
    var detailStoryViewModel = DetailStoryViewModel()
}





