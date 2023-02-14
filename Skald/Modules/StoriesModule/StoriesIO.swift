//
//  StoriesIO.swift
//  Skald
//
//  Created by Александр Прайд on 21.12.2022.
//

import Foundation

protocol StoriesInput: AnyObject {
    
}

protocol StoriesOutput: AnyObject {
    func showDetails(_ story: Story)
    func showSettingsViewController()
}


