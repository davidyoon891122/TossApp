//
//  NewsView.swift
//  TossSecurities
//
//  Created by David Yoon on 2022/01/03.
//

import UIKit

class NewsView: UIView {
    
    private let newsCellId = "newsCell"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(NewsViewTableViewCell.self, forCellReuseIdentifier: newsCellId)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.addSubviews()
        self.setLayoutConstraints()
    }
}



extension NewsView: UITableViewDelegate {
    
}

extension NewsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "주요 뉴스"
            cell.accessoryType = .disclosureIndicator
            cell.backgroundColor = .systemBackground
            cell.tintColor = .label
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: newsCellId, for: indexPath) as! NewsViewTableViewCell
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else if indexPath.section == 1 {
            return 120
        }
        return 50
    }
    
}

private extension NewsView {
    func addSubviews() {
        self.addSubview(self.tableView)
    }
    
    func setLayoutConstraints() {
        self.tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.tableView.heightAnchor.constraint(equalToConstant: 170).isActive = true
    }
}
