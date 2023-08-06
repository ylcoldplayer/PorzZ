//
//  PorzzSearchCollectionViewCell.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/21/23.
//

import UIKit

class PorzzSearchCollectionViewCell: UICollectionViewCell {
    var image: UIImage? {
        didSet {
            thumbnail?.image = image
//            scrollView.contentSize = thumbnail.frame.size
        }
    }
    
    var positionName: String? {
        didSet {
            positinSearchDescriptionInfoView?.positionName = positionName
            setNeedsDisplay()
        }
    }
    
    var technique: String? {
        didSet {
            positinSearchDescriptionInfoView?.technique = technique
            setNeedsDisplay()
        }
    }
    
    
    private var positinSearchDescriptionInfoView: PositinSearchDescriptionInfoView! = {
        return PositinSearchDescriptionInfoView()
    }()
    
    private var thumbnail: ThumbNailImageView! = {
        let tn = ThumbNailImageView()
        return tn
    }()
    
    
    var knowMoreButton: UIButton! = {
        let button = UIButton(type: .system)
        return button
    }()
    
    var buttonAction: (() -> Void)?

    @objc func tapCell() {
        buttonAction?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        contentView.backgroundColor = Constants.Colors.lightBlack
        contentView.layer.cornerRadius = 10
        
        
        knowMoreButton.addTarget(self, action: #selector(tapCell), for: .touchUpInside)

        // config thumbnail
        setUpSubviews()
    }
    
    
    private func setUpSubviews() {
        
        // config thumbnail
        contentView.addSubview(thumbnail)

        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        let thumbnailOffsetValue = CGFloat(15)
        NSLayoutConstraint.activate([
            thumbnail.topAnchor.constraint(equalTo: contentView.topAnchor, constant: thumbnailOffsetValue),
            thumbnail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -thumbnailOffsetValue),
            thumbnail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: thumbnailOffsetValue),
        ])


        let tnWidthConstraint = NSLayoutConstraint(item: thumbnail!,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1,
                                                constant: contentView.frame.size.height-thumbnailOffsetValue-CGFloat(5))

        thumbnail.layer.cornerRadius = (contentView.frame.size.height-thumbnailOffsetValue)*0.25
        thumbnail.clipsToBounds = true
        thumbnail.addConstraint(tnWidthConstraint)
        
        // config button to the right of the cell
        knowMoreButton.setTitle("More", for: .normal)
        knowMoreButton.setTitleColor(Constants.Colors.darkBrown, for: .normal)
        knowMoreButton.backgroundColor = Constants.Colors.lightBlackExtra
        knowMoreButton.layer.cornerRadius = contentView.frame.height * 0.15
        contentView.addSubview(knowMoreButton)
            
        knowMoreButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonOffsetValue = CGFloat(15)
        let buttonHeightScaleValue = contentView.frame.size.height/8.0
        NSLayoutConstraint.activate([
            knowMoreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -buttonOffsetValue),
            knowMoreButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: buttonHeightScaleValue*2.5),
            knowMoreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -buttonHeightScaleValue*2.5)
        ])
        let buttonWidthConstraint = NSLayoutConstraint(item: knowMoreButton!,
                                                       attribute: .width,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1,
                                                       constant: contentView.frame.size.height/2)
        knowMoreButton.addConstraint(buttonWidthConstraint)
        
        
        // config position info view
        contentView.addSubview(positinSearchDescriptionInfoView)
        positinSearchDescriptionInfoView.backgroundColor = .clear
        positinSearchDescriptionInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positinSearchDescriptionInfoView.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor),
            positinSearchDescriptionInfoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            positinSearchDescriptionInfoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            positinSearchDescriptionInfoView.trailingAnchor.constraint(equalTo: knowMoreButton.leadingAnchor, constant: -buttonOffsetValue)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ThumbNailImageView: UIView {
    var image: UIImage? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        image?.draw(in: bounds)
    }
}


class PositinSearchDescriptionInfoView: UIView {
    var positionName: String? {
        didSet {
            positionNameLabel.text = positionName
            setNeedsDisplay()
        }
    }
    
    var technique: String? {
        didSet {
            techniqueLabel.text = technique
            setNeedsDisplay()
        }
    }
    
    private var positionNameLabel: UILabel!
    private var techniqueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.shadowOpacity = 0
        
        positionNameLabel = UILabel()
        positionNameLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        positionNameLabel.textAlignment = .left
        positionNameLabel.textColor = .brown
        addSubview(positionNameLabel)
        
        positionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        let topAnchorOffset = CGFloat(25)
        NSLayoutConstraint.activate([
            positionNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: topAnchorOffset),
            positionNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(20)),
            positionNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
        techniqueLabel = UILabel()
        techniqueLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        techniqueLabel.textAlignment = .center
        techniqueLabel.textColor = .brown.withAlphaComponent(CGFloat(0.6))
        techniqueLabel.font = UIFont.italicSystemFont(ofSize: 15)
        techniqueLabel.lineBreakMode = .byTruncatingTail
        addSubview(techniqueLabel)
        techniqueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            techniqueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(20)),
            techniqueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            techniqueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -CGFloat(25))
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

