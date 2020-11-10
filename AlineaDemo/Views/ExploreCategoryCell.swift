//
//  ExploreCategoryCell.swift
//  AlineaDemo
//
//  Created by Mayank(King) 09/11/20.
//

import UIKit

let exploreCellIdentifier = "ExploreCategoryCell"

class ExploreCategoryCell: UICollectionViewCell {
    
    // MARK: - Properties
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 41
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Jaydip Godhani"
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Properties
    lazy var categoryIconBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = .clear
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var categoryIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "crypto")
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    // MARK: - Start
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    private func setupUI() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(categoryIconBackground)
        categoryIconBackground.addSubview(categoryIcon)
        roundedBackgroundView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            roundedBackgroundView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            roundedBackgroundView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            //categoryIcon.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            
            categoryIconBackground.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor),
            categoryIconBackground.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor, constant: 32),
            categoryIconBackground.widthAnchor.constraint(equalToConstant: 50),
            categoryIconBackground.heightAnchor.constraint(equalToConstant: 50),
            
            categoryIcon.centerXAnchor.constraint(equalTo: categoryIconBackground.centerXAnchor),
            categoryIcon.centerYAnchor.constraint(equalTo: categoryIconBackground.centerYAnchor),
            //categoryIcon.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor, constant: 32),
            categoryIcon.widthAnchor.constraint(equalToConstant: 25),
            categoryIcon.heightAnchor.constraint(equalToConstant: 25),
            
            //titleLabel.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: categoryIconBackground.rightAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: roundedBackgroundView.rightAnchor, constant: -16),
        ])
    }
    
    
    //MARK:- Set Data
    var mCategory: CategoryModal! {
        didSet {
            roundedBackgroundView.backgroundColor = mCategory.categoryBackgroundColor
            categoryIcon.image = mCategory.categoryIcon
            titleLabel.text = mCategory.categoryName
        }
    }
}
