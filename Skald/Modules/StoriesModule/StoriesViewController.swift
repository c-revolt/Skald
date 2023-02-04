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

    private weak var viewModel: StoriesViewModelProtocol?
    private var collectionView: UICollectionView?
    
    let storiesFromJSON = Bundle.main.decode([Stories].self, from: "storiesData.json")
    
    init(viewModel: StoriesViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupCollectionView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        
        let resizableLayout = ResizableLayout()
       // let layout = UICollectionViewFlowLayout()
        //collectionView?.collectionViewLayout = resizableLayout
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: resizableLayout)
        guard let collectionView = collectionView else { return }
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .green
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.decelerationRate = .fast
        
        collectionView.register(StoriesViewCell.self, forCellWithReuseIdentifier: StoriesViewCell.reusedID)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}

// MARK:
extension StoriesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(storiesFromJSON.count)
        return storiesFromJSON.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesViewCell.reusedID, for: indexPath) as? StoriesViewCell else { return UICollectionViewCell() }
        
        let stories = storiesFromJSON[indexPath.item]
        print(stories.storyTitle)
        cell.backgroundImageView.image = UIImage(named: stories.storyImage ?? "")
        cell.titleLabel.text = stories.storyTitle
        
        return cell
    }
    
    
    
    
}

extension StoriesViewController: UICollectionViewDelegate {
    
}

// MARK: StoriesViewControllerProtocol
extension StoriesViewController: StoriesViewControllerProtocol {
    
}
