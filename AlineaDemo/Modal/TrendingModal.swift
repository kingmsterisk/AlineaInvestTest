//
//  TrendingModal.swift
//  AlineaDemo
//
//  Created by Mayank(King) 10/11/20.
//

import Foundation
import AVKit

struct TrendingCategoryModal {
    let name: String
    let values: [TrendingModal]
}

struct TrendingModal {
    let trendingIcon: UIImage
    let name: String
    let subName: String
    let trending: String
    let trendingColor: UIColor
}

let arrayTrendingCategory = [
    TrendingCategoryModal(name: "Top Gainers", values: [
        TrendingModal(trendingIcon: UIImage(named: "pintreest")!, name: "Pinterest", subName: "PINS", trending: "-4.77%", trendingColor: UIColor(named: "TrendingMinusColor")!),
        TrendingModal(trendingIcon: UIImage(named: "evoqua")!, name: "Evoqua Water", subName: "AQUA", trending: "+5.99%", trendingColor: UIColor(named: "TrendingPlusColor")!),
        TrendingModal(trendingIcon: UIImage(named: "medifast")!, name: "Medifast", subName: "MEDI", trending: "+50.78", trendingColor: UIColor(named: "TrendingPlusColor")!),
    ]),
    TrendingCategoryModal(name: "Top Sellers", values: [
        TrendingModal(trendingIcon: UIImage(named: "evoqua")!, name: "Evoqua Water", subName: "AQUA", trending: "+5.99%", trendingColor: UIColor(named: "TrendingPlusColor")!),
        TrendingModal(trendingIcon: UIImage(named: "medifast")!, name: "Medifast", subName: "MEDI", trending: "+50.78", trendingColor: UIColor(named: "TrendingPlusColor")!),
    ])
]

