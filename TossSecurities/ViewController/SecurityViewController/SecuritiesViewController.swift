//
//  SecuritiesViewController.swift
//  TossSecurities
//
//  Created by David Yoon on 2022/01/02.
//

import UIKit

class SecuritiesViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView = UIView()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let passwordViewController = PasswordViewController()
        self.present(passwordViewController, animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        self.addSubviews()
        self.setLayoutContraints()
    }
}


private extension SecuritiesViewController {
    func configureNavigation() {
        self.navigationItem.title = "토스증권"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let rightSettingItemBar = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(tapSettingButton))
        let rightSearchItemBar = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(tapSearchButton))
        rightSearchItemBar.tintColor = .label
        rightSettingItemBar.tintColor = .label
        self.navigationItem.rightBarButtonItems = [rightSettingItemBar, rightSearchItemBar]
    }
    
    func addSubviews() {
        self.view.addSubview(self.scrollView)
        
            
    }
    
    
    func setLayoutContraints() {
        self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    @objc func tapSettingButton() {
        print("SettingsButton Tapped...")
    }
    
    @objc func tapSearchButton() {
        print("SearchButton Tapped...")
    }
    
    
    
}
