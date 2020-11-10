//
//  AlineaTabbarController.swift
//  AlineaDemo
//
//  Created by Mayank(King) 09/11/20.
//

import UIKit

class AlineaTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //// Set the bottom tab bar here
        let searchScreen = UINavigationController(rootViewController: SearchController())
        searchScreen.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let tabBarList = [searchScreen]
        viewControllers = tabBarList

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
