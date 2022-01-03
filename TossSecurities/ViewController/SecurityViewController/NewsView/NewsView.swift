//
//  NewsView.swift
//  TossSecurities
//
//  Created by David Yoon on 2022/01/03.
//

import UIKit

class NewsView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
            return cell
        }
        return UITableViewCell()
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
    }
}
