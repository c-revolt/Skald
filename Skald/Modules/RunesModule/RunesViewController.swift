//
//  RunesViewController.swift
//  Skald
//
//  Created by Александр Прайд on 04.02.2023.
//

import UIKit

// MARK: RunesViewControllerProtocol
protocol RunesViewControllerProtocol: AnyObject {
    
}

// MARK: StoriesViewController
class RunesViewController: UIViewController {

    // properties
    private var viewModel: RunesViewModelProtocol?
    private var collectionView: UICollectionView?
    private var runesDataProvider: RunesDataProvider?
    
    // lifecircle
    init(viewModel: RunesViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RunesViewModel()
        view.backgroundColor = .purple
        title = K.TabBarTitles.runes
        setupCollectionView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // methods
    private func setupCollectionView() {
        runesDataProvider = RunesDataProvider()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.bounds.size.width - 20, height: (self.view.bounds.size.height / 2) - 20)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = runesDataProvider
        collectionView.delegate = runesDataProvider
        collectionView.decelerationRate = .fast
        
        collectionView.register(RunesViewCell.self, forCellWithReuseIdentifier: RunesViewCell.reusedID)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        collectionView?.frame = view.bounds
    }
    
    
}

// MARK: StoriesViewControllerProtocol
extension RunesViewController: RunesViewControllerProtocol {
    
}

