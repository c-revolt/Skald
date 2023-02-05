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
    weak var viewModel: RunesViewCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel,
                  let runeImage = viewModel.imageString else { return }
            titleLabel.text = viewModel.titleString
            runeImageView.image = UIImage(named: runeImage)
            ettirLabel.text = viewModel.ettirString
            meaningLabel.text = viewModel.meaningString
            overviewLabel.text = viewModel.overviewString
            
        }
    }
    
    private let backVIew: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
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
    
    var ettirLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var meaningLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
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
    
    private func viewHeirarchy() {
        addSubview(backVIew)
        backVIew.addSubview(titleLabel)
        backVIew.addSubview(runeImageView)
        backVIew.addSubview(ettirLabel)
        backVIew.addSubview(meaningLabel)
        backVIew.addSubview(overviewLabel)
    }
    
    private func applyConstraints() {
        backVIew.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        runeImageView.translatesAutoresizingMaskIntoConstraints = false
        ettirLabel.translatesAutoresizingMaskIntoConstraints = false
        meaningLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            backVIew.topAnchor.constraint(equalTo: topAnchor),
            backVIew.leadingAnchor.constraint(equalTo: leadingAnchor),
            backVIew.trailingAnchor.constraint(equalTo: trailingAnchor),
            backVIew.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: backVIew.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: backVIew.topAnchor, constant: 15),

            runeImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            runeImageView.centerXAnchor.constraint(equalTo: backVIew.centerXAnchor),
            runeImageView.heightAnchor.constraint(equalToConstant: 100),
            runeImageView.widthAnchor.constraint(equalToConstant: 40),
            
            ettirLabel.centerXAnchor.constraint(equalTo: backVIew.centerXAnchor),
            ettirLabel.topAnchor.constraint(equalTo: runeImageView.bottomAnchor, constant: 10),
            
            meaningLabel.centerXAnchor.constraint(equalTo: backVIew.centerXAnchor),
            meaningLabel.topAnchor.constraint(equalTo: ettirLabel.bottomAnchor, constant: 10),
            
            //overviewLabel.centerXAnchor.constraint(equalTo: backVIew.centerXAnchor),
            overviewLabel.topAnchor.constraint(equalTo: meaningLabel.bottomAnchor, constant: 10),
            overviewLabel.leadingAnchor.constraint(equalTo: backVIew.leadingAnchor, constant: 10),
            overviewLabel.trailingAnchor.constraint(equalTo: backVIew.trailingAnchor, constant: -10),
            overviewLabel.bottomAnchor.constraint(equalTo: backVIew.bottomAnchor, constant: -10)
            
        ])
        
        
        NSLayoutConstraint.activate([
            
        ])
    }
}

