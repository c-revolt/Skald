//
//  StoriesViewCell.swift
//  Skald
//
//  Created by Александр Прайд on 23.12.2022.
//

import UIKit

class StoriesViewCell: UICollectionViewCell {
    
    // properties
    static let reusedID = K.storiesCellReusedID
    
    weak var viewModel: StoriesViewCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel,
                  let storyImage = viewModel.imageString else { return }
            titleLabel.text = viewModel.titleString
            backgroundImageView.image = UIImage(named: storyImage)
            runeLabel.text = viewModel.runeString
            // runeImage
        }
    }
    
    // backgroundImageView
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // shadowView
    private let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    // titleLabel
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private var runeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        viewHeirarchy()
        applyConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
    
    private func viewHeirarchy() {
        addSubview(shadowView)
        createGradient()
        shadowView.addSubview(backgroundImageView)
        addSubview(titleLabel)
        addSubview(runeLabel)
    }
    
    private func applyConstraints() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        runeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            backgroundImageView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            

            
            runeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            runeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            runeLabel.widthAnchor.constraint(equalToConstant: 50),
            runeLabel.heightAnchor.constraint(equalToConstant: 50),

            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200)
            
        ])
    }
}
