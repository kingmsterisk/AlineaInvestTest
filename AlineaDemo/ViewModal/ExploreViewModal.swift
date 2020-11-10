//
//  ExploreViewModal.swift
//  AlineaDemo
//
//  Created by Mayank(King) 10/11/20.
//

import Foundation
import UIKit

enum ExploreSelection: Int {
    case Category = 0
    case Themes = 1
    case Trending = 2
}

class ExploreViewModal {
    
    //MARK:- Variabels
    var exploreSelection = ExploreSelection.Category.rawValue
    
    //MARK:- Access data from view modals
    func backgroundColor() -> UIColor {
        switch exploreSelection {
        case ExploreSelection.Category.rawValue:
            return UIColor(named: "DataBackgroudColor")!
        case ExploreSelection.Themes.rawValue:
            return .white
        default:
            return UIColor(named: "DataBackgroudColor")!
        }
    }
    func numberOfSection() -> Int {
        if exploreSelection == ExploreSelection.Trending.rawValue { return arrayTrendingCategory.count }
        return 1
    }
    //MARK:- Category
    var numberOfCategory: Int {
        return arrayCategories.count
    }
    func category(at index: Int) -> CategoryModal {
        return arrayCategories[index]
    }
    //MARK:- Theme
    var numberOfTheme: Int {
        return arrayTheme.count
    }
    func theme(at index: Int) -> ThemeModal {
        return arrayTheme[index]
    }
    //MARK:- Trending
    func trendingCategoryName(at section: Int) -> String {
        return arrayTrendingCategory[section].name
    }
    func numberOfTrending(at section: Int) -> Int {
        return arrayTrendingCategory[section].values.count
    }
    func trending(at section: Int, index: Int) -> TrendingModal {
        return arrayTrendingCategory[section].values[index]
    }
}
