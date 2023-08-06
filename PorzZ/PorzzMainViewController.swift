//
//  PorzzMainViewController.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/20/23.
//

import UIKit
import GameplayKit


private let reusableIdentifier = "cell"
private let porzzMainCollectionViewCellIdetifier = "PorzzMainCollectionViewCellIdetifier"
private let porzzMainCollectionViewChooseCellIdentifier = "PorzzMainCollectionViewChooseCellIdentifier"
private let porzzMainCollectionViewQuoteCellIdentifier = "PorzzMainCollectionViewQuoteCellIdentifier"

private let quoteStringAttibutes: [NSAttributedString.Key: Any] = [
    .font: UIFont.italicSystemFont(ofSize: 17),
    .foregroundColor: UIColor.brown
]

private let whoAttibutes: [NSAttributedString.Key: Any] = [
    .font: UIFont.boldSystemFont(ofSize: 15),
    .foregroundColor: Constants.Colors.darkBrown
]

class PorzzMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var porzzMainCollectionView: UICollectionView! {
        didSet {
            porzzMainCollectionView.dataSource = self
            porzzMainCollectionView.delegate = self
            porzzMainCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reusableIdentifier)
            porzzMainCollectionView.register(PorzzMainCollectionViewCell.self, forCellWithReuseIdentifier: porzzMainCollectionViewCellIdetifier)
            porzzMainCollectionView.register(PorzzMainCollectionViewChooseCell.self, forCellWithReuseIdentifier: porzzMainCollectionViewChooseCellIdentifier)
            porzzMainCollectionView.register(PorzzMainCollectionViewQuoteCell.self, forCellWithReuseIdentifier: porzzMainCollectionViewQuoteCellIdentifier)
        }
    }
    
    var timer: Timer?
    
    var timerCounter: Int64 = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = porzzMainCollectionView.dequeueReusableCell(withReuseIdentifier: porzzMainCollectionViewCellIdetifier, for: indexPath) as? PorzzMainCollectionViewCell {
                cell.tapNameLabelAction = { [weak self] in
                    print(cell.randomPosition?.name ?? "default position name")
                    let positionCardVC = PorzzCardCollectionViewController()
                    positionCardVC.position = cell.randomPosition
                    self?.navigationController?.pushViewController(positionCardVC, animated: true)
                }
                return cell
            }
        } else if indexPath.section == 1 {
            if let cell = porzzMainCollectionView.dequeueReusableCell(withReuseIdentifier: porzzMainCollectionViewChooseCellIdentifier, for: indexPath) as? PorzzMainCollectionViewChooseCell {
                cell.tapRandomButtonAction = { [weak self] in
                    let positionCardVC = PorzzCardCollectionViewController()
                    positionCardVC.position = Positions.shared.allPositions.randomElement()
                    self?.navigationController?.pushViewController(positionCardVC, animated: true)
                }
                cell.tapNewButtonAction = { [weak self] in
                    print("tapNewButtonAction")
                    let positionCardVC = PorzzCardCollectionViewController()
                    // TODO: if all positions have been tried, inform user there are no new positions anymore
                    positionCardVC.position = Positions.shared.allPositions.filter{$0.tried == false}.randomElement()
                    self?.navigationController?.pushViewController(positionCardVC, animated: true)
                }
                return cell
            }
        } else {
            if let cell = porzzMainCollectionView.dequeueReusableCell(withReuseIdentifier: porzzMainCollectionViewQuoteCellIdentifier, for: indexPath) as? PorzzMainCollectionViewQuoteCell {
                
                var quote = Quotes.shared.allQuotes.first!
                
                if let randomQuote = getQuoteOfTheDay() {
                    quote = randomQuote
                }
                
                let quoteContent = quote.components(separatedBy: "#")
                
                let quoteString = quoteContent[0].trimmingCharacters(in: .whitespaces)
                let quoteWho = "-- " + quoteContent[1].trimmingCharacters(in: .whitespaces)
                
                
                cell.quoteLabel.attributedText = NSAttributedString(string: quoteString, attributes: quoteStringAttibutes)
                cell.whoLabel.attributedText = NSAttributedString(string: quoteWho, attributes: whoAttibutes)
                
                return cell
            }
        }
        
        let cell = porzzMainCollectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: view.frame.size.width, height: view.frame.size.width*0.5)
        case 1:
            return CGSize(width: view.frame.size.width, height: view.frame.size.width*0.7)
        case 2:
            return computeHeightOfQuoteCell(for: Quotes.shared.allQuotes.first!)
        default:
            return CGSize.zero
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        porzzMainCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        porzzMainCollectionView.backgroundColor = .black.withAlphaComponent(CGFloat(1))
        view.addSubview(porzzMainCollectionView)
        
        porzzMainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            porzzMainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            porzzMainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            porzzMainCollectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: view.frame.size.height*0.15),
            porzzMainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        // spacing between different sections
        if let layout = porzzMainCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.headerReferenceSize = CGSize(width: 0, height: 10)
        }
        
        
        // update position of the day
        timer = Timer.scheduledTimer(timeInterval: 10.0,
                                     target: self,
                                     selector: #selector(refreshCells),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    @objc func refreshCells() {
        timerCounter += 1
        if let cell = porzzMainCollectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as? PorzzMainCollectionViewCell {
            cell.randomPosition = cell.getRandomPosition()
            porzzMainCollectionView.reloadData()
        }
    }
        
        //    @objc func refreshQuote() {
        //        if timerCounter%2 == 0 {
        //            if let cell = porzzMainCollectionView.cellForItem(at: IndexPath(row: 0, section: 2)) as? PorzzMainCollectionViewQuoteCell {
        //                cell.quoteLabel.text = getQuoteOfTheDay()
        //            }
        //            porzzMainCollectionView.reloadData()
        //        }
        //    }
        
        private func computeHeightOfQuoteCell(for quote: String) -> CGSize {
            let maxSize = CGSize(width: porzzMainCollectionView.bounds.width, height: .greatestFiniteMagnitude)
            
            
            let quoteContent = quote.components(separatedBy: "#")
            
            let quoteString = quoteContent[0].trimmingCharacters(in: .whitespaces)
            let quoteWho = quoteContent[1].trimmingCharacters(in: .whitespaces)
            
            
            let textRectForQuoteString = (quoteString as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: quoteStringAttibutes, context: nil)
            let quoteHeight = textRectForQuoteString.height
            
            let textRectForWho = (quoteWho as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: whoAttibutes, context: nil)
            
            let whoHeight = textRectForWho.height
            
            let width = porzzMainCollectionView.bounds.width
            return CGSize(width: width, height: ceil(quoteHeight + whoHeight + CGFloat(20)))
        }
        
        
        private func randomElement<T>(from collection: [T], seed: UInt64) -> T? {
            guard !collection.isEmpty else { return nil }
            
            let source = GKLinearCongruentialRandomSource(seed: seed)
            let index = source.nextInt(upperBound: collection.count)
            return collection[index]
        }
        
        private func getQuoteOfTheDay() -> String? {
            let date = Date()
            let calendar = Calendar.current
            let startOfDay = calendar.startOfDay(for: date)
            let seed = UInt64(startOfDay.timeIntervalSince1970)
            return randomElement(from: Quotes.shared.allQuotes, seed: seed)
            
        }
    }
