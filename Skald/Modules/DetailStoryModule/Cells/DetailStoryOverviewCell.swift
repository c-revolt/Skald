//
//  DetailStoryOverviewCell.swift
//  Skald
//
//  Created by Александр Прайд on 14.02.2023.
//

import UIKit

class DetailStoryOverviewCell: UICollectionViewCell {
    
    static let reusedID = K.detailStoryOverviewReusedID
    private weak var viewModel: DetailStoryOverviewCellViewModelProtocol?
    private let overviewLabel = UILabel()
    

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
        addSubview(overviewLabel)
    }
    
    private func setupView() {
        overviewLabel.numberOfLines = 0
        overviewLabel.textAlignment = .justified
        overviewLabel.font = UIFont(name: "The Times New Romans", size: 15)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate(
            [
                overviewLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                overviewLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
            ]
        )
    }
    
}
