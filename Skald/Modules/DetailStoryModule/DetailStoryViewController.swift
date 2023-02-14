//
//  DetailStoryViewController.swift
//  Skald
//
//  Created by Александр Прайд on 09.02.2023.
//

import UIKit

protocol DetailStoryViewControllerProtocol: AnyObject {
    
}

class DetailStoryViewController: UIViewController {
    
    private var viewModel: DetailStoryViewModelProtocol? = nil
    private var tableView: UITableView?
    private var storiesDataProvider: DetailStoryDataProvider?
   // private var story: Story?
    
    init(viewModel: DetailStoryViewModelProtocol? = nil) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .red
        tableView?.reloadData()
        
    }
}


extension DetailStoryViewController: DetailStoryViewControllerProtocol {
    
}
