//
//  ViewController.swift
//  Skald
//
//  Created by Александр Прайд on 21.12.2022.
//

import UIKit

// MARK: StoriesViewControllerProtocol
protocol StoriesViewControllerProtocol: AnyObject {
    
}

// MARK: StoriesViewController
class StoriesViewController: UIViewController {

    private let viewModel: StoriesViewModelProtocol?
    private var collectionView: UICollectionView?
    private var resizableLayout = ResizableLayout()
    private var storiesDataProvider: StoriesDataProvider?
    
    
    // lifecircle
    init(viewModel: StoriesViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
    }
    override func viewDidLayoutSubviews() {
        collectionView?.frame = view.bounds
    }
    
    private func setupCollectionView() {
        storiesDataProvider = StoriesDataProvider()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.bounds.size.width, height: 130)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = storiesDataProvider
        collectionView.delegate = storiesDataProvider
        collectionView.decelerationRate = .fast
        
        collectionView.register(StoriesViewCell.self, forCellWithReuseIdentifier: StoriesViewCell.reusedID)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        title = K.TabBarTitles.stories
        let plusImage = UIImage(systemName: "slider.vertical.3")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = barButtonItem
        //navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedRightBarButton() {
        viewModel?.tappedRightBarButton()
    }
}

// MARK: StoriesViewControllerProtocol
extension StoriesViewController: StoriesViewControllerProtocol {
    
}
