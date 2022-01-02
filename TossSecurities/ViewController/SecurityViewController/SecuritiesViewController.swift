//
//  SecuritiesViewController.swift
//  TossSecurities
//
//  Created by David Yoon on 2022/01/02.
//

import UIKit

class SecuritiesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
    }
}


private extension SecuritiesViewController {
    func configureNavigation() {
        self.navigationItem.title = "토스증권"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
