//
//  CategoryModal.swift
//  AlineaDemo
//
//  Created by Mayank(King) 10/11/20.
//

import Foundation
import AVKit

struct CategoryModal {
    let categoryIcon: UIImage
    let categoryName: String
    let categoryBackgroundColor: UIColor
}

let arrayCategories = [
    CategoryModal(categoryIcon: UIImage(named: "stock")!, categoryName: "Stocks", categoryBackgroundColor: UIColor(named: "StocksColor")!),
    CategoryModal(categoryIcon: UIImage(named: "ETFs")!, categoryName: "ETFs", categoryBackgroundColor: UIColor(named: "PrimaryColor")!),
    CategoryModal(categoryIcon: UIImage(named: "crypto")!, categoryName: "Crypto", categoryBackgroundColor: UIColor(named: "CryptoColor")!),
]
