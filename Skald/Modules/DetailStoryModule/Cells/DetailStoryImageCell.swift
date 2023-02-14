//
//  DetailStoryImageCell.swift
//  Skald
//
//  Created by Александр Прайд on 14.02.2023.
//

import UIKit

class DetailStoryHeaderCell: UICollectionViewCell {
    
    static let reusedID = K.detailStoryHeaderReusedID
    private weak var viewModel: DetailStoryHeaderCellViewModelProtocol?
    private let storyImageView = UIImageView()
    private let shadowView = UIView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        viewHeirarchy()
        setupView()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewHeirarchy() {
        addSubview(shadowView)
        createGradient()
        shadowView.addSubview(storyImageView)
        addSubview(titleLabel)
    }
    
    private func setupView() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        storyImageView.contentMode = .scaleToFill
        storyImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textAlignment = .center
        titleLabel.font = .avenir26()
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate(
            [
                shadowView.topAnchor.constraint(equalTo: contentView.topAnchor),
                shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                storyImageView.topAnchor.constraint(equalTo: shadowView.topAnchor),
                storyImageView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
                storyImageView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
                storyImageView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),

                titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                titleLabel.widthAnchor.constraint(equalToConstant: 200)
            ]
        )
        
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
}
