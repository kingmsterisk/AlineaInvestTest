//
//  SearchController.swift
//  AlineaDemo
//
//  Created by Mayank(King) 09/11/20.
//

import UIKit

class SearchController: UIViewController {

    //MARK:- Layout views
    lazy var segmentExplore: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Category", "Themes", "Trending"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentCategorySelection(sender:)), for: .valueChanged)
        return segment
    }()
    
    lazy var collectionExplore: UICollectionView = {
        let collectionView  = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor(named: "DataBackgroudColor")
        collectionView.register(ExploreCategoryCell.self, forCellWithReuseIdentifier: exploreCellIdentifier)
        collectionView.register(ThemesCell.self, forCellWithReuseIdentifier: themeCellIdentifier)
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellIdentifier)
        collectionView.register(TrendingHeaderViewView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerViewIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout =  {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8) // according to your requirements
        layout.minimumInteritemSpacing = 0 // according to your requirements
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    
    //MARK:- Variables
    var viewModal = ExploreViewModal()
    
    //MARK:- Start
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultProperties()
    }
    private func setDefaultProperties() {
        view.backgroundColor = Colors.backgroundColor
        navigationItem.title = "Explore"
        
        //// Set the navigation side menu and notification button
        let buttonSideMenu = UIBarButtonItem(image: UIImage(named: "sieMenu"), style: .plain, target: self, action: #selector(buttonNotificationClick))
        buttonSideMenu.tintColor = .black
        navigationItem.leftBarButtonItem = buttonSideMenu
        
        let buttonNotification = UIBarButtonItem(image: UIImage(named: "notification"), style: .plain, target: self, action: #selector(buttonNotificationClick))
        buttonNotification.tintColor = .black
        navigationItem.rightBarButtonItem = buttonNotification
        
        //// Segment for the Explore selection
        setupSegmentView()
        ///// CollectionView for dynamic list
        setupCollectionView()
    }
    private func setupSegmentView() {
        view.addSubview(segmentExplore)
        segmentExplore.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        segmentExplore.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        segmentExplore.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        segmentExplore.topAnchor.constraint(equalTo: margins.topAnchor, constant: 16).isActive = true
        segmentExplore.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    private func setupCollectionView() {
        //collectionExplore = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        //collectionExplore?.backgroundColor = .lightGray
        view.addSubview(collectionExplore)
        collectionExplore.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.safeAreaLayoutGuide
        collectionExplore.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        collectionExplore.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        collectionExplore.topAnchor.constraint(equalTo: segmentExplore.bottomAnchor, constant: 16).isActive = true
        collectionExplore.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
    @objc func segmentCategorySelection(sender: UISegmentedControl) {
        viewModal.exploreSelection = sender.selectedSegmentIndex
        collectionExplore.backgroundColor = viewModal.backgroundColor()
        collectionExplore.reloadData()
    }
    //MARK:- Navigation button Side menu, Notification click
    @objc func buttonSideMenuClick(sender: UIBarButtonItem) {
        
    }
    @objc func buttonNotificationClick(sender: UIBarButtonItem) {
        
    }
}

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModal.numberOfSection()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch viewModal.exploreSelection {
        case ExploreSelection.Category.rawValue:
            return viewModal.numberOfCategory
        case ExploreSelection.Themes.rawValue:
            return viewModal.numberOfTheme
        case ExploreSelection.Trending.rawValue:
            return viewModal.numberOfTrending(at: section)
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModal.exploreSelection {
        case ExploreSelection.Category.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: exploreCellIdentifier, for: indexPath) as! ExploreCategoryCell
            cell.mCategory = viewModal.category(at: indexPath.row)
            return cell
        case ExploreSelection.Themes.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: themeCellIdentifier, for: indexPath) as! ThemesCell
            cell.mTheme = viewModal.theme(at: indexPath.row)
            return cell
        case ExploreSelection.Trending.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellIdentifier, for: indexPath) as! TrendingCell
            cell.trending = viewModal.trending(at: indexPath.section, index: indexPath.row)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch viewModal.exploreSelection {
        case ExploreSelection.Category.rawValue:
            return CGSize(width: collectionView.frame.size.width, height: 102)
        case ExploreSelection.Themes.rawValue:
            let width = ((collectionView.frame.size.width - 16) / 2)
            return CGSize(width: width, height: width * 1.1)
        case ExploreSelection.Trending.rawValue:
            return CGSize(width: collectionView.frame.size.width, height: 80)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    // MARK:- Header label for trending
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerViewIdentifier, for: indexPath) as! TrendingHeaderViewView
            view.categoryName = viewModal.trendingCategoryName(at: indexPath.section)
            return view
        }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if viewModal.exploreSelection == ExploreSelection.Trending.rawValue {
            return CGSize(width: collectionView.frame.size.width, height: 50)
        }
        return CGSize(width: collectionView.frame.size.width, height: 0)
    }
}
