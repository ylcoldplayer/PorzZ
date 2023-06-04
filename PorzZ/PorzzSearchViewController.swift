//
//  PorzzSearchViewController.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/21/23.
//

import UIKit

private let reusableIdentifier = "cell"
private let porzzSearchCollectionViewCellIdetifier = "PorzzSearchCollectionViewCell"

class PorzzSearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchResultsUpdating, UITabBarControllerDelegate {

    var filteredPositions = [Position]()
    
    var searchController = UISearchController(searchResultsController: nil)
    
    var porzzSearchCollectionView: UICollectionView! {
        didSet {
            porzzSearchCollectionView.dataSource = self
            porzzSearchCollectionView.delegate = self
            porzzSearchCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reusableIdentifier)
            porzzSearchCollectionView.register(PorzzSearchCollectionViewCell.self, forCellWithReuseIdentifier: porzzSearchCollectionViewCellIdetifier)
        }
    }
    
    
    // MARK: collection view config
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredPositions.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = porzzSearchCollectionView.dequeueReusableCell(withReuseIdentifier: porzzSearchCollectionViewCellIdetifier, for: indexPath) as? PorzzSearchCollectionViewCell {
            let position = filteredPositions[indexPath.row]
            if let image = position.image, let posName = position.name, let tn = position.technique{
                cell.image = image
                cell.positionName = posName
                cell.technique = tn
                cell.buttonAction = { [weak self] in
                    let porzzCardVC = PorzzCardCollectionViewController()
                    porzzCardVC.position = self?.filteredPositions[indexPath.row]
                    self?.navigationController?.pushViewController(porzzCardVC, animated: true)
                }
            }
            return cell
        }
        
        let cell = porzzSearchCollectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let fixedHeight = 100.0
        var widthToHeightRatio = 1.0
        if let ratio = filteredPositions[indexPath.row].image?.heightToWidthRatio() {
            widthToHeightRatio = widthToHeightRatio/ratio
        }
        return CGSize(width: view.frame.size.width, height: fixedHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    
    //MARK: UISearch Controller
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            filteredPositions = Positions.shared.allPositions.filter{ $0.containsSearchText(withTextString: text)}
        } else {
            filteredPositions = Positions.shared.allPositions
        }
        porzzSearchCollectionView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
                
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        porzzSearchCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        porzzSearchCollectionView.backgroundColor = .black
        view.addSubview(porzzSearchCollectionView)
        
        porzzSearchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            porzzSearchCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            porzzSearchCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            porzzSearchCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            porzzSearchCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        // search bar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "search your position"
        definesPresentationContext = true

        searchController.searchBar.tintColor = .gray
        searchController.searchBar.backgroundColor = .black
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = UIColor.gray
        }
        searchController.searchBar.becomeFirstResponder()
        
        // set shadow image to be clear
//        if let navigationBar = self.navigationController?.navigationBar {
//            navigationBar.setBackgroundImage(UIImage(), for: .default)
//            navigationBar.shadowImage = UIImage()
//        }
        
        filteredPositions = Positions.shared.allPositions
        
        
        // tab bar controller delegate
        self.tabBarController?.delegate = self
    }
    
    
    // MAKR: tabbarcontroller delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let navigationController = tabBarController.selectedViewController as? UINavigationController, let searchVC = navigationController.viewControllers.first as? PorzzSearchViewController, searchVC == self {
//            let naviBarHeight = (self.navigationController?.navigationBar.frame.height ?? 0.0)
            let searchBarCoordinateInScreen = self.searchController.searchBar.convert(self.searchController.searchBar.bounds, to: nil)
            let searchBarHeight =  self.searchController.searchBar.frame.origin.y
            let topOffset = CGPoint(x: 0, y: -searchBarCoordinateInScreen.origin.y - searchBarHeight - 10)
            porzzSearchCollectionView.setContentOffset(topOffset, animated: true)
        }
        return true
    }
}

