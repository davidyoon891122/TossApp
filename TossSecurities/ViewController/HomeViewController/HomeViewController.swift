//
//  HomeViewController.swift
//  TossSecurities
//
//  Created by David Yoon on 2022/01/02.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let accountTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
    }
    
    
    
    
}


private extension HomeViewController {
    func configureNavigation() {
        self.navigationItem.title = "toss"
    }
}
