//
//  TrendingHeaderViewView.swift
//  AlineaDemo
//
//  Created by Mayank(King) 10/11/20.
//

import UIKit
let headerViewIdentifier = "TrendingHeaderViewView"

class TrendingHeaderViewView: UICollectionReusableView {
    // MARK: - views
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Top Gainers"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Start
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    private func setupUI() {
        self.addSubview(titleLabel)
        self.backgroundColor = .white
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    //MARK:- Set data
    var categoryName: String! {
        didSet {
            titleLabel.text = categoryName
        }
    }
}
