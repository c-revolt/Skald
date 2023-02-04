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
    
    // backgroundImageView
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
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
    
    func update(with model: Story) {
        self.titleLabel.text = model.storyTitle
        self.backgroundImageView.image = UIImage(named: model.storyImage ?? "")
    }
    
    private func viewHeirarchy() {
        addSubview(backgroundImageView)
        backgroundImageView.addSubview(shadowView)
        addSubview(titleLabel)
    }
    
    private func applyConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            shadowView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
