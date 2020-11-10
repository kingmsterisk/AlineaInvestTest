//
//  ThemesCell.swift
//  AlineaDemo
//
//  Created by Mayank(King) 10/11/20.
//

import UIKit

let themeCellIdentifier = "ThemesCell"

class ThemesCell: UICollectionViewCell {
    
    // MARK: - views
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(named: "DataBackgroudColor")!
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var themeIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        roundedBackgroundView.addSubview(themeIcon)
        roundedBackgroundView.addSubview(titleLabel)
        //roundedBackgroundView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            roundedBackgroundView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
            roundedBackgroundView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8),
            
            themeIcon.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor, constant: 16),
            themeIcon.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            themeIcon.widthAnchor.constraint(equalToConstant: 90),
            themeIcon.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: themeIcon.bottomAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8),
        ])
    }
    
    
    //MARK:- Set data
    var mTheme: ThemeModal! {
        didSet {
            themeIcon.image = mTheme.themeIcon
            titleLabel.text = mTheme.themeName
        }
    }
}
