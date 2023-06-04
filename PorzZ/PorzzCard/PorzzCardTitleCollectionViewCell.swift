//
//  PorzzCardTitleCollectionViewCell.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/21/23.
//

import UIKit

class PorzzCardTitleCollectionViewCell: UICollectionViewCell {
    var label: UILabel!
    
    var latestTimeTried: UILabel! {
        didSet {
            setNeedsLayout()
            setNeedsDisplay()
        }
    }
    
    var tried = false {
        didSet {
            let newTryButtonText = tried ? "Try Again" : "Try Now"
            tryButton.setTitle(newTryButtonText, for: .normal)
        }
    }
    
    var tryButton: UIButton! {
        didSet {
            setNeedsLayout()
            setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        contentView.backgroundColor = Constants.Colors.lightBlack
        contentView.layer.cornerRadius = 10
        
        label = UILabel()
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.textAlignment = .center
        label.textColor = .brown
        
        // when sizetofit gets called, the label disappears in the collection view, need to figure out why... is it related to auto layout? answer: this is because at this stage, the text is nill, hence the label will shrink to the mininal size
//        label.sizeToFit()
    
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.size.height * 0.75),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.7)
        ])
        label.sizeToFit()
        
        
        // last latest try
        latestTimeTried = UILabel()
        let latestTryAttibutes: [NSAttributedString.Key: Any] = [
            .font: UIFont.italicSystemFont(ofSize: 10),
            .foregroundColor: UIColor.brown
        ]
        latestTimeTried.attributedText = NSAttributedString(string: "latest time tried: havn't tried yet ", attributes: latestTryAttibutes)
        latestTimeTried.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        latestTimeTried.textAlignment = .center
        latestTimeTried.textColor = .brown
        contentView.addSubview(latestTimeTried)
        latestTimeTried.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            latestTimeTried.topAnchor.constraint(equalTo: label.bottomAnchor),
            latestTimeTried.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentView.frame.size.height*0.25*0.2),
            latestTimeTried.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            latestTimeTried.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.75)
        ])
        latestTimeTried.sizeToFit()
        
        
        // config try button
        tryButton = UIButton()
        let titleText = tried ? "Try Again" : "Try Now"
        tryButton.setTitle(titleText, for: .normal)
        tryButton.setTitleColor(Constants.Colors.darkBrown, for: .normal)
        tryButton.titleLabel?.adjustsFontSizeToFitWidth = true
        tryButton.titleLabel?.minimumScaleFactor = 0.5
        tryButton.backgroundColor = Constants.Colors.lightBlackExtra
        tryButton.layer.cornerRadius = contentView.frame.height * 0.15
        contentView.addSubview(tryButton)
        tryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tryButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height*0.25),
            tryButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentView.frame.height*0.3),
            tryButton.leadingAnchor.constraint(equalTo: label.trailingAnchor),
            tryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        tryButton.isUserInteractionEnabled = true
        tryButton.addTarget(self, action: #selector(tryButtonAction), for: .touchUpInside)
    }
    
    
    var tryButtonActionDelegate: (() -> Void)?
    
    @objc private func tryButtonAction() {
        tryButtonActionDelegate?()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
