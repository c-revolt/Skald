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
    
}
