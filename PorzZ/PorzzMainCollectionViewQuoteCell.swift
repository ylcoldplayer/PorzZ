//
//  PorzzMainCollectionViewQuoteCell.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 6/3/23.
//

import UIKit

class PorzzMainCollectionViewQuoteCell: UICollectionViewCell {
    var quoteLabel: UILabel! {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    var whoLabel: UILabel! {
        didSet {
            setNeedsLayout()
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = Constants.Colors.lightBlack
        contentView.layer.cornerRadius = 10
        
        quoteLabel = UILabel()
        quoteLabel.numberOfLines = 0
        contentView.addSubview(quoteLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            quoteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            quoteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
        
        whoLabel = UILabel()
        whoLabel.numberOfLines = 0
        contentView.addSubview(whoLabel)
        whoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whoLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 5),
            whoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
