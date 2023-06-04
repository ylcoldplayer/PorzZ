//
//  PorzzMainCollectionViewChooseCell.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/22/23.
//

import UIKit

class PorzzMainCollectionViewChooseCell: UICollectionViewCell {
    
    var chooseRandomPositionButton: UIButton!
    
    var chooseNewPositionButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // config content view
        contentView.backgroundColor = .clear
        self.layer.cornerRadius = contentView.frame.size.height * 0.1
        self.layer.masksToBounds = true
        
        
        // random button
        chooseRandomPositionButton = UIButton()
        chooseRandomPositionButton.setTitle("Try Random PorzZ?", for: .normal)
        chooseRandomPositionButton.setTitleColor(Constants.Colors.darkBrown, for: .normal)
        chooseRandomPositionButton.backgroundColor = Constants.Colors.lightBlackExtra
        chooseRandomPositionButton.layer.cornerRadius = contentView.frame.height * 0.1
        contentView.addSubview(chooseRandomPositionButton)
        
        chooseRandomPositionButton.addTarget(self, action: #selector(tapRandomButton), for: .touchUpInside)
        
        chooseRandomPositionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseRandomPositionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.size.height*0.5*0.2),
            chooseRandomPositionButton.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.size.height*0.5 - contentView.frame.size.height*0.5*0.2),
            chooseRandomPositionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.size.width*0.25),
            chooseRandomPositionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.frame.size.width*0.25)
        ])
        
        
        // new button
        chooseNewPositionButton = UIButton()
        chooseNewPositionButton.setTitle("Try New PorzZ?", for: .normal)
        chooseNewPositionButton.setTitleColor(Constants.Colors.darkBrown, for: .normal)
        chooseNewPositionButton.backgroundColor = Constants.Colors.lightBlackExtra
        chooseNewPositionButton.layer.cornerRadius = contentView.frame.height * 0.1
        contentView.addSubview(chooseNewPositionButton)
        
        chooseNewPositionButton.addTarget(self, action: #selector(tapNewButton), for: .touchUpInside)
        
        chooseNewPositionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseNewPositionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.size.height*0.5 + contentView.frame.size.height*0.5*0.2),
            chooseNewPositionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentView.frame.size.height*0.5*0.2),
            chooseNewPositionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.size.width*0.25),
            chooseNewPositionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.frame.size.width*0.25)
        ])
        
    }
    
    
    var tapRandomButtonAction: (()->Void)?
    
    @objc private func tapRandomButton() {
        tapRandomButtonAction?()
    }
    
    
    var tapNewButtonAction: (()->Void)?
    
    @objc private func tapNewButton() {
        tapNewButtonAction?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
