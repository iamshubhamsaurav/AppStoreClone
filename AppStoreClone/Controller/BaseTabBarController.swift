//
//  BaseTabBarController.swift
//  AppStoreClone
//
//  Created by Shubham Saurav on 8/23/19.
//  Copyright © 2019 Shubham Saurav. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewControllers = [
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: ViewController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: ViewController(), title: "Today", imageName: "today_icon")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        viewController.navigationItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
