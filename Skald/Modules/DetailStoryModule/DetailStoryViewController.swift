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
    private var collectionView: UICollectionView?
    private var storyDataProvider: DetailStoryDataProvider?
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
        setupCollectionView()
    }
    
    
    
    override func viewDidLayoutSubviews() {
        collectionView?.frame = view.bounds
    }
    
    private func setupCollectionView() {
        storyDataProvider = DetailStoryDataProvider()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = storyDataProvider
        collectionView.delegate = storyDataProvider
        collectionView.decelerationRate = .fast
        
        collectionView.register(DetailStoryHeaderCell.self, forCellWithReuseIdentifier: DetailStoryHeaderCell.reusedID)
        collectionView.register(DetailStoryOverviewCell.self, forCellWithReuseIdentifier: DetailStoryOverviewCell.reusedID)
        
        NSLayoutConstraint.activate(
            [
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
    
    
}


extension DetailStoryViewController: DetailStoryViewControllerProtocol {
    
}
