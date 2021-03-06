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
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView = UIView()
    
    private var menuBar = MenuBar()
    private var scrollViewTopConstraint: NSLayoutConstraint?
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .orange
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        
        let newsView = NewsView(frame: .zero)
        menuBar = MenuBar(frame: .zero)
        let accountView = UIView()
        accountView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        accountView.backgroundColor = . gray
//        let interestStockView = UIView()
        newsView.backgroundColor = .purple
//        accountView.backgroundColor = .red
//        interestStockView.backgroundColor = .brown
//
//        [newsView, accountView, interestStockView]
//            .forEach{
//                stackView.addArrangedSubview($0)
//            }
//
        stackView.addArrangedSubview(newsView)
        stackView.addArrangedSubview(menuBar)
        stackView.addArrangedSubview(accountView)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        scrollView.delegate = self
        
        
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


extension SecuritiesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 170 {
            menuBar.isHidden = true
            //menuBar.removeFromSuperview()
            view.addSubview(menuBar)
            
            scrollViewTopConstraint?.isActive = false
            scrollView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
            
            menuBar.translatesAutoresizingMaskIntoConstraints = false
            menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
        } else {
            menuBar.isHidden = false
        }
        
    }
}


private extension SecuritiesViewController {
    func configureNavigation() {
        self.navigationItem.title = "????????????"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let rightSettingItemBar = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(tapSettingButton))
        let rightSearchItemBar = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(tapSearchButton))
        rightSearchItemBar.tintColor = .label
        rightSettingItemBar.tintColor = .label
        self.navigationItem.rightBarButtonItems = [rightSettingItemBar, rightSearchItemBar]
    }
    
    func addSubviews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.stackView)
        
            
    }
    
    
    func setLayoutContraints() {
        scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        scrollViewTopConstraint?.isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.contentView.backgroundColor = .green
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        
        self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
    }
    
    @objc func tapSettingButton() {
        print("SettingsButton Tapped...")
    }
    
    @objc func tapSearchButton() {
        print("SearchButton Tapped...")
    }
    
    
    
}



