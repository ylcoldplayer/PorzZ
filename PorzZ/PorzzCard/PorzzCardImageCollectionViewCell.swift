//
//  PorzzImageCollectionViewCell.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/20/23.
//

import UIKit

class PorzzCardImageCollectionViewCell: UICollectionViewCell {
    var porzzImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        porzzImageView = UIImageView(frame: self.contentView.bounds)
        porzzImageView.backgroundColor = .black
        if let image = UIImage(named: "men-shealth-stand-deliver-1581102532") {
            porzzImageView.image = image
            porzzImageView.layer.cornerRadius = contentView.frame.size.height*0.05
            porzzImageView.layer.masksToBounds = true
        }
        porzzImageView.contentMode = .scaleToFill
        porzzImageView.clipsToBounds = true
        
        contentView.addSubview(porzzImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
