//
//  BaseListController.swift
//  AppStoreClone
//
//  Created by Shubham Saurav on 8/23/19.
//  Copyright © 2019 Shubham Saurav. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
