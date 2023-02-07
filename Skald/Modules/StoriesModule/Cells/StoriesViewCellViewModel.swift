//
//  StoriesViewCellViewModel.swift
//  Skald
//
//  Created by Александр Прайд on 07.02.2023.
//

import UIKit

protocol StoriesViewCellViewModelProtocol: AnyObject {
   
    var titleString: String? { get }
    var imageString: String? { get }
    var runeString: String? { get }
    var contentString: String? { get }
    
}

final class StoriesViewCellViewModel {
    
    private let stories: Story?
    
    init(stories: Story? = nil) {
        self.stories = stories
    }
}

extension StoriesViewCellViewModel: StoriesViewCellViewModelProtocol {
    var titleString: String? {
        guard let stories = stories else { return "Unknown Error" }
        return stories.storyTitle
    }
    
    var imageString: String? {
        guard let stories = stories else { return "Unknown Error" }
        return stories.storyImage
    }
    
    var runeString: String? {
        guard let stories = stories else { return "Unknown Error" }
        return stories.storyRune
    }
    
    var contentString: String? {
        guard let stories = stories else { return "Unknown Error" }
        return stories.storyContent
    }


    
}

