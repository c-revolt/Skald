//
//  DetailStoryViewModel.swift
//  Skald
//
//  Created by Александр Прайд on 09.02.2023.
//

import UIKit

protocol DetailStoryViewModelProtocol: AnyObject {

    init(view: DetailStoryViewControllerProtocol?, output: DetailStoryOutput?, story: Story?)
    
}

final class DetailStoryViewModel {
    
    weak var view: DetailStoryViewControllerProtocol?
    private weak var output: DetailStoryOutput?
    private var story: Story?
    
    init(view: DetailStoryViewControllerProtocol? = nil, output: DetailStoryOutput? = nil, story: Story? = nil) {
        self.view = view
        self.output = output
        self.story = story
    }
}

extension DetailStoryViewModel: DetailStoryViewModelProtocol {


   
}
