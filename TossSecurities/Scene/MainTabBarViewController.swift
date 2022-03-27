//
//  MainTabBarController.swift
//  TossSecurities
//
//  Created by David Yoon on 2022/01/02.
//

import UIKit


class MainTabBarViewController: UITabBarController {
    
    private let homeViewController: UINavigationController = {
        let viewController = HomeViewController()
        let tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    
    private let securitiesViewController: UINavigationController = {
        let viewController = SecuritiesViewController()
        let tabBarItem = UITabBarItem(
            title: "주식",
            image: UIImage(systemName: "chart.bar.xaxis"),
            tag: 1
        )
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTabBar()
        self.viewControllers = [homeViewController, securitiesViewController]
    }
}



private extension MainTabBarViewController {
    func configureTabBar() {
        self.tabBar.tintColor = .label
        
        self.tabBar.layer.cornerRadius = 25
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.borderColor = UIColor.gray.cgColor
        self.tabBar.layer.borderWidth = 0.5
    }
}
