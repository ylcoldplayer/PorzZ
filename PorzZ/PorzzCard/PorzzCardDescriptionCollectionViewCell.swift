//
//  PorzzCardDescriptionCollectionViewCell.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/23/23.
//

import UIKit

class PorzzCardDescriptionCollectionViewCell: UICollectionViewCell {
    var descriptionLabel: UILabel! {
        didSet {
            setNeedsLayout()
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = Constants.Colors.lightBlack
        contentView.layer.cornerRadius = 10
        
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
