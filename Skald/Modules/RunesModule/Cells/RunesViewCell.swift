//
//  RunesViewCell.swift
//  Skald
//
//  Created by Александр Прайд on 04.02.2023.
//

import UIKit

class RunesViewCell: UICollectionViewCell {
    
    // properties
    static let reusedID = K.runesCellReusedID
    
    private let backVIew: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        return view
    }()

    let runeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
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
    
    func update(with model: Rune) {
        self.titleLabel.text = model.runeTitle
        self.runeImageView.image = UIImage(named: model.runeImage ?? "")
    }
    
    private func viewHeirarchy() {
        addSubview(backVIew)
        backVIew.addSubview(runeImageView)
        backVIew.addSubview(titleLabel)
    }
    
    private func applyConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        runeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            runeImageView.topAnchor.constraint(equalTo: topAnchor),
            runeImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            runeImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            runeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backVIew.topAnchor.constraint(equalTo: topAnchor),
            backVIew.leadingAnchor.constraint(equalTo: leadingAnchor),
            backVIew.trailingAnchor.constraint(equalTo: trailingAnchor),
            backVIew.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

