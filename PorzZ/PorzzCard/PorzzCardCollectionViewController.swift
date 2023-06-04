//
//  PorzzCardCollectionViewController.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/20/23.
//

import UIKit

private let reuseIdentifier = "Cell"
private let porzzCardImageCollectionViewCell = "PorzzCardImageCollectionViewCell"
private let porzzCardTittleCollectionViewCell = "PorzzCardTittleCollectionViewCell"
private let porzzCardDescriptionCollectionViewCell = "PorzzCardDescriptionCollectionViewCell"

private let darkBrown = UIColor(red: 0.5, green: 0.26, blue: 0.13, alpha: 1.0)

class PorzzCardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var position: Position?
    
    private let numberOfSections = 3
    
    init() {
        let layout = UICollectionViewFlowLayout() // Create a layout
        layout.scrollDirection = .vertical
        // Call UICollectionViewController's designated initializer
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.collectionView.backgroundColor = .black
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(PorzzCardImageCollectionViewCell.self, forCellWithReuseIdentifier: porzzCardImageCollectionViewCell)
        self.collectionView!.register(PorzzCardTitleCollectionViewCell.self, forCellWithReuseIdentifier: porzzCardTittleCollectionViewCell)
        self.collectionView!.register(PorzzCardDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: porzzCardDescriptionCollectionViewCell)
        // Do any additional setup after loading the view.
        
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.headerReferenceSize = CGSize(width: 0, height: 10)
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: porzzCardImageCollectionViewCell, for: indexPath) as? PorzzCardImageCollectionViewCell{
                cell.porzzImageView.image = position?.image
                return cell
            }
        } else if indexPath.section == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: porzzCardTittleCollectionViewCell, for: indexPath) as? PorzzCardTitleCollectionViewCell {
                let myAttribute = [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 25.0)!]
                cell.label.attributedText = NSAttributedString(string: position?.name ?? "default", attributes: myAttribute)
                
                cell.tried = position?.tried ?? false
                cell.tryButtonActionDelegate = { [weak self] in
                    self?.position?.count += 1
                    self?.position?.tried = true
                    self?.position?.datesTried?.append(Date())
                    cell.tried = true
                }
                
                var tryDate = "havn't tried yet"
                if let latestDate = position?.datesTried?.last {
                    let formatter = DateFormatter()
                    formatter.timeZone = TimeZone(abbreviation: "PST") // Set timezone to Pacific Standard Time
                    formatter.dateFormat = "MM-dd-yy hh:mm:ss"
                    tryDate = formatter.string(from: latestDate)
                }
                let latestTryAttibutes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.italicSystemFont(ofSize: 10),
                    .foregroundColor: UIColor.brown
                ]
                cell.latestTimeTried.attributedText = NSAttributedString(string: "latest time tried: " + tryDate, attributes: latestTryAttibutes)
                
                return cell
            }
        } else if indexPath.section == 2 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: porzzCardDescriptionCollectionViewCell, for: indexPath) as? PorzzCardDescriptionCollectionViewCell {
                if let thisPosition = position {
                    cell.descriptionLabel.attributedText = getAttributedDescriptionString(forPosition: thisPosition)
                }
                return cell
            }
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
    
    private func getAttributedDescriptionString(forPosition position: Position) -> NSAttributedString {
        let finalAttibutedString = NSMutableAttributedString()
        let techniqe = position.technique ?? ""
        let aka = position.aka ?? ""
        let benefits = position.benefits ?? ""
        let alsoTry = position.alsoTry ?? ""
        let hotTips = position.tip ?? ""
        if !techniqe.isEmpty {
            finalAttibutedString.append(getAttributedString(withTitle: "Technique", withDetails: techniqe))
            finalAttibutedString.append(NSAttributedString(string: "\n \n"))
        }
        if !aka.isEmpty {
            finalAttibutedString.append(getAttributedString(withTitle: "A.K.A", withDetails: aka))
            finalAttibutedString.append(NSAttributedString(string: "\n \n"))
        }
        if !benefits.isEmpty {
            finalAttibutedString.append(getAttributedString(withTitle: "Benefits", withDetails: benefits))
            finalAttibutedString.append(NSAttributedString(string: "\n \n"))
        }
        if !hotTips.isEmpty {
            finalAttibutedString.append(getAttributedString(withTitle: "Hot Tips", withDetails: hotTips))
            finalAttibutedString.append(NSAttributedString(string: "\n \n"))
        }
        if !alsoTry.isEmpty {
            finalAttibutedString.append(getAttributedString(withTitle: "Also Try", withDetails: alsoTry))
        }
        return finalAttibutedString
    }
    
    private func getAttributedString(withTitle title: String, withDetails details: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        let titleAttibutes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: darkBrown
        ]
        let detailsAttibutes: [NSAttributedString.Key: Any] = [
            .font: UIFont.italicSystemFont(ofSize: 15),
            .foregroundColor: UIColor.brown
        ]
        attributedString.append(NSAttributedString(string: title, attributes: titleAttibutes))
        attributedString.append(NSAttributedString(string: "\n"))
        attributedString.append(NSAttributedString(string: details, attributes: detailsAttibutes))
        
        return attributedString
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widtth = view.frame.width
        
        switch indexPath.section {
        case 0:
            return CGSize(width: widtth, height: widtth*(position?.image?.heightToWidthRatio() ?? 1.0))
        case 1:
            return CGSize(width: widtth, height: 80)
        case 2:
            if let thisPosition = position {
                return computeHeightOfDescptionCell(for: thisPosition)
            }
            return CGSize.zero
        default:
            return CGSize(width: widtth, height: widtth)
        }
    }
    
    private func computeHeightOfDescptionCell(for position: Position) -> CGSize {
        
        let technique = position.technique ?? ""
        let aka = position.aka ?? ""
        let benefits = position.benefits ?? ""
        let alsoTry = position.alsoTry ?? ""
        let hotTips = position.tip ?? ""
        
        let maxSize = CGSize(width: collectionView.bounds.width, height: .greatestFiniteMagnitude)
        
        
        let titleAttibutes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: darkBrown
        ]
        let titleString = (technique.isEmpty ? "" : "Technique") + "\n" + (aka.isEmpty ? "" : "A.K.A") + "\n" + (benefits.isEmpty ? "" : "Benefits") + "\n" + (alsoTry.isEmpty ? "" : "Also Try") + "\n" + (hotTips.isEmpty ? "" : "Hot Tips")
        let textRectForTitles = (titleString as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: titleAttibutes, context: nil)
        let titleHeight = textRectForTitles.height
        
        let detailsAttibutes: [NSAttributedString.Key: Any] = [
            .font: UIFont.italicSystemFont(ofSize: 15),
            .foregroundColor: UIColor.brown
        ]
        let details = technique + "\n" + aka + "\n" + benefits + "\n" + alsoTry + "\n" + hotTips
        let textRectForDetails = (details as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: detailsAttibutes, context: nil)
        let detailsHeight = textRectForDetails.height
        
        var spacingCount = 1
        let descriptionArray = [technique, aka, benefits, alsoTry, hotTips]
        for descriptionEle in descriptionArray {
            spacingCount += descriptionEle.isEmpty ? 0 : 1
        }

        let font = UIFont.systemFont(ofSize: 17)
        let lineHeight = font.lineHeight
      
        
        let width = collectionView.bounds.width
        return CGSize(width: width, height: ceil(titleHeight + detailsHeight + lineHeight*CGFloat(spacingCount)))
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


extension UIImage {
    func heightToWidthRatio() -> Double {
        if self.size.width != 0.0 {
            return self.size.height/self.size.width
        }
        return 1.0
    }
}
