//
//  TrendingCell.swift
//  AlineaDemo
//
//  Created by Mayank(King) 10/11/20.
//

import UIKit

let trendingCellIdentifier = "TrendingCell"


class TrendingCell: UICollectionViewCell {
    
    //MARK:- Views
    lazy var trendingIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "pintreest")
        icon.contentMode = .scaleAspectFill
        icon.layer.cornerRadius = 25
        icon.layer.masksToBounds = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    // MARK: - views
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "DataBackgroudColor")!.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var trendingPercentageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .lightGray
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var trendingNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var trendingSubLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Medifast"
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
        self.contentView.addSubview(trendingIcon)
        self.contentView.addSubview(dividerView)
        self.contentView.addSubview(trendingPercentageLabel)
        self.contentView.addSubview(trendingNameLabel)
        self.contentView.addSubview(trendingSubLabel)
        
        NSLayoutConstraint.activate([
            trendingIcon.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 32),
            trendingIcon.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            trendingIcon.heightAnchor.constraint(equalToConstant: 50),
            trendingIcon.widthAnchor.constraint(equalToConstant: 50),
            
            dividerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            dividerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            dividerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            trendingPercentageLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -32),
            trendingPercentageLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            trendingPercentageLabel.heightAnchor.constraint(equalToConstant: 30),
            trendingPercentageLabel.widthAnchor.constraint(equalToConstant: 90),
            
            trendingNameLabel.leftAnchor.constraint(equalTo: trendingIcon.rightAnchor, constant: 16),
            trendingNameLabel.rightAnchor.constraint(equalTo: trendingPercentageLabel.leftAnchor, constant: 8),
            trendingNameLabel.topAnchor.constraint(equalTo: trendingIcon.topAnchor, constant: 2),
            trendingNameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            trendingSubLabel.leftAnchor.constraint(equalTo: trendingIcon.rightAnchor, constant: 16),
            trendingSubLabel.rightAnchor.constraint(equalTo: trendingPercentageLabel.leftAnchor, constant: 8),
            trendingSubLabel.topAnchor.constraint(equalTo: trendingNameLabel.bottomAnchor, constant: 4),
            trendingNameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    
    //MARK:- Set data
    var trending: TrendingModal! {
        didSet {
            trendingIcon.image = trending.trendingIcon
            trendingNameLabel.text = trending.name
            trendingSubLabel.text = trending.subName
            trendingPercentageLabel.text = trending.trending
            trendingPercentageLabel.backgroundColor = trending.trendingColor
        }
    }
}
