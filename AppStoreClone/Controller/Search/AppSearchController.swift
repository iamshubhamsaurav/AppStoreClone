//
//  AppSearchController.swift
//  AppStoreClone
//
//  Created by Shubham Saurav on 8/23/19.
//  Copyright © 2019 Shubham Saurav. All rights reserved.
//

import UIKit


class AppSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellId = "cellId"
    // Having trouble centering the label. Will be fixed in the second commit
//    let enterSearchTermLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Please enter a search term."
//        label.font = .boldSystemFont(ofSize: 20)
//        label.textColor = UIColor.darkText
//        label.textAlignment = .center
//        label.numberOfLines = 2
//        return label
//    }()
    
    var appResults = [Result]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchBar()
//        collectionView.addSubview(enterSearchTermLabel)
//        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: -50))
    }
    
    func setupSearchBar() {
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText, completion: { (results, error) in
                if let error = error {
                    print("Failed to fetch and decode data due to the :-> ", error)
                    return
                }
//                guard let appResult = results else {return}
                self.appResults = results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.appResult = appResults[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    
    
    
}
