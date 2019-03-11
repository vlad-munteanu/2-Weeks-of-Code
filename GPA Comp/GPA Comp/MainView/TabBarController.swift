//
//  TabBarController.swift
//  GPA Comp
//
//  Created by Vlad Munteanu on 3/11/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        let mainVC = MainVC()
        mainVC.tabBarItem.title = "Main"
        mainVC.tabBarItem.image = UIImage(named: "main")
        
        let settingsVC = SettingsVC()
        settingsVC.tabBarItem.title = "Settings"
        settingsVC.tabBarItem.image = UIImage(named: "scan")
        
        
        let viewControllerList = [mainVC, settingsVC]
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
}
