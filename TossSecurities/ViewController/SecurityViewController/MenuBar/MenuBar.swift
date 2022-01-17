//
//  MenuBar.swift
//  TossSecurities
//
//  Created by David Yoon on 2022/01/13.
//

import UIKit

class MenuBar: UIView {
    private let cellId = "menuCell"
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    private let menus: [String] = { [
        "내 주식",
        "관심",
        "해외",
        "인기",
        "커뮤니티"
    ]}()
    
    private lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setLayoutConstraint()
        configureHorizontalBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}





extension MenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        //let menuColor: [UIColor] = [.red,.orange,.yellow, .green, .blue]
        //cell.backgroundColor = menuColor[indexPath.row]
        cell.titleLabel.text = menus[indexPath.row]
        return cell
    }
    
    
}

extension MenuBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 5, height: 50)
    }
}


private extension MenuBar {
    
    func configureHorizontalBar() {
        let horizontalBar = UIView()
        horizontalBar.backgroundColor = .label
        addSubview(horizontalBar)
        
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false
        horizontalBarLeftAnchorConstraint = horizontalBar.leadingAnchor.constraint(equalTo: leadingAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        horizontalBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/5).isActive = true
        horizontalBar.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        
    }
    
    func addSubviews() {
        addSubview(menuCollectionView)
    }
    
    func setLayoutConstraint() {
        menuCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menuCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
