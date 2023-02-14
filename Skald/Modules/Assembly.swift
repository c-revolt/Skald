//
//  Assembly.swift
//  Skald
//
//  Created by Александр Прайд on 21.12.2022.
//

import UIKit

class Assembly {
    
    func makeStories(output: StoriesOutput) -> UIViewController {
        let viewModel = StoriesViewModel(output: output)
        let view = StoriesViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view
    }
    
    func makeSettings(output: SettingsOutput) -> UIViewController {
        let viewModel = SettingsViewModel(optput: output)
        let view = SettingsViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view
    }
    
    func makeDetails(output: DetailStoryOutput, story: Story) -> UIViewController {
        let viewModel = DetailStoryViewModel(output: output, story: story)
        let view = DetailStoryViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view
    }
    
}
