//
//  PassWordViewController.swift
//  TossSecurities
//
//  Created by David Yoon on 2022/01/03.
//

import UIKit

class PasswordViewController: UIViewController {
    private lazy var checkLabel: UILabel = {
        let label = UILabel()
        label.text = "OOO님이 맞는지 확인할게요"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        print("PassWordViewController")
        self.addSubviews()
        self.setLayoutConstraints()
    }
}


private extension PasswordViewController {
    func addSubviews() {
        self.view.addSubview(checkLabel)
    }
    
    func setLayoutConstraints() {
        self.checkLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive = true
        self.checkLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
