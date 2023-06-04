//
//  PorzzMainCollectionViewCell.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/21/23.
//

import UIKit
import GameplayKit

private let positionOfTheDayString = "Position Of The Day"


class PorzzMainCollectionViewCell: UICollectionViewCell {
    
    var allPositions = Positions.shared
    
    var randomPosition: Position? {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
            positionImageView.image = randomPosition?.image
            positionOfDayNameLabel.attributedText = getPositionNameString()
            dateBannerLabel.attributedText = getDateString()
        }
    }
    
    
    var positionOfDayBannerLabel: UILabel! {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    
    var dateBannerLabel: UILabel! {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    
    var positionImageView: UIImageView! {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    
    var positionOfDayNameLabel: UILabel! {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        randomPosition = getRandomPosition()
        
        // config content view
        contentView.backgroundColor = Constants.Colors.lightBlack
        self.layer.cornerRadius = contentView.frame.size.height * 0.1
        self.layer.masksToBounds = true
        
        
        // config position of the day banner label
        positionOfDayBannerLabel = UILabel()
        positionOfDayBannerLabel.numberOfLines = 1
        positionOfDayBannerLabel.textAlignment = .left
        positionOfDayBannerLabel.attributedText = getPositionOfTheDayString()
        contentView.addSubview(positionOfDayBannerLabel)
        
        positionOfDayBannerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positionOfDayBannerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.size.width*0.12),
            positionOfDayBannerLabel.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.size.width*0.6),
            positionOfDayBannerLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        let positionOfDayBannerLabelHeightConstraint = NSLayoutConstraint(
            item: positionOfDayBannerLabel!,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: contentView.frame.height/7)
        positionOfDayBannerLabel.addConstraint(positionOfDayBannerLabelHeightConstraint)
        
        
        
        // config date banner label
        dateBannerLabel = UILabel()

        dateBannerLabel.numberOfLines = 1
        dateBannerLabel.textAlignment = .right
        dateBannerLabel.attributedText = getDateString()
        contentView.addSubview(dateBannerLabel)

        dateBannerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateBannerLabel.leadingAnchor.constraint(equalTo: positionOfDayBannerLabel.trailingAnchor, constant: 15),
            dateBannerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            dateBannerLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        let dateBannerLabelHeightConstraint = NSLayoutConstraint(
            item: dateBannerLabel!,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: contentView.frame.height/7)
        dateBannerLabel.addConstraint(dateBannerLabelHeightConstraint)

        
        // config image view
        positionImageView = UIImageView()
        positionImageView.image = UIImage(named: "menshealth-davidscopperfield-1581102244")
        if let randomImage = randomPosition?.image {
            positionImageView.image = randomImage
        }
        contentView.addSubview(positionImageView)
        
    
        positionImageView.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = positionImageView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 20)
        let trailingConstraint = positionImageView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.leadingAnchor, constant: (contentView.frame.size.height*1.3)-25.0)
        let centerConstraint = positionImageView.centerXAnchor.constraint(equalTo: contentView.leadingAnchor, constant: (contentView.frame.size.height*1.3-25.0)*0.5 )

        NSLayoutConstraint.activate([
            leadingConstraint,
            trailingConstraint,
            positionImageView.topAnchor.constraint(equalTo: positionOfDayBannerLabel.bottomAnchor, constant: 10),
            positionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            centerConstraint
        ])
        
        
        
        let adjustedRaito = max(min((1.0/(positionImageView.image?.heightToWidthRatio() ?? 1.0)), 1.3),0.5)
        let adjustedWidth = contentView.frame.size.height*adjustedRaito
        let positionImageViewWidthConstraint = NSLayoutConstraint(
            item: positionImageView!,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: adjustedWidth)
//        positionImageView.image?.draw(at: )
        positionImageView.addConstraint(positionImageViewWidthConstraint)
        
        positionImageView.layer.cornerRadius = adjustedWidth*0.1
        positionImageView.layer.masksToBounds = true
        
        
        // config name label
        positionOfDayNameLabel = UILabel()
        positionOfDayNameLabel.numberOfLines = 0
        positionOfDayNameLabel.textAlignment = .center
        positionOfDayNameLabel.attributedText = getPositionNameString()
        contentView.addSubview(positionOfDayNameLabel)
        
        positionOfDayNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positionOfDayNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: (contentView.frame.size.height*1.3)),
            positionOfDayNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            positionOfDayNameLabel.topAnchor.constraint(equalTo: dateBannerLabel.bottomAnchor),
            positionOfDayNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapName))
        tapGesture.numberOfTapsRequired = 1
        positionOfDayNameLabel.addGestureRecognizer(tapGesture)
        positionOfDayNameLabel.isUserInteractionEnabled = true
    }
    
    
    var tapNameLabelAction: (()->Void)?
    
    @objc private func tapName(_ sender: UIGestureRecognizer) {
        switch sender.state {
        case .ended:
            tapNameLabelAction?()
        default:
            return
        }
    }
    
    
    
    private func getPositionNameString() -> NSAttributedString {
        let positionName = randomPosition?.name ?? "Face UP"
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 25),
            .foregroundColor: UIColor.brown
        ]
        
        let attributedSecondString = NSAttributedString(string: positionName, attributes: secondAttributes)
        
        let finalString = NSMutableAttributedString()
        finalString.append(attributedSecondString)
        
        return finalString
    }
    
    
    
    private func getPositionOfTheDayString() -> NSAttributedString {
        let firstString = positionOfTheDayString
        let firstAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: Constants.Colors.darkBrown
        ]
        let attributedFirstString = NSAttributedString(string: firstString, attributes: firstAttributes)
        
        return attributedFirstString
    }
    
    
    private func getDateString() -> NSAttributedString {
        let now = Date()
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone(abbreviation: "PST") // Set timezone to Pacific Standard Time
        formatter.dateFormat = "MM-dd-yyyy "
        let pstDate = formatter.string(from: now)
        
        let pstDateAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: Constants.Colors.darkBrown
        ]
        
        let attributePstDateString = NSAttributedString(string: pstDate, attributes: pstDateAttributes)
        
        return attributePstDateString
    }
    
    
    
    // TODO: bad design, should move to controller 
    func getRandomPosition() -> Position? {
        let date = Date()
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let seed = UInt64(startOfDay.timeIntervalSince1970)
        return randomElement(from: allPositions.allPositions, seed: seed)
    }
    
    
    func randomElement<T>(from collection: [T], seed: UInt64) -> T? {
        guard !collection.isEmpty else { return nil }
        
        let source = GKLinearCongruentialRandomSource(seed: seed)
        let index = source.nextInt(upperBound: collection.count)
        return collection[index]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
