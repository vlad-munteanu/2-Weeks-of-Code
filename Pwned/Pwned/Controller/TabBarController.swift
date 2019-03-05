//
//  TabBarController.swift
//  Pwned
//
//  Created by Vlad Munteanu on 3/5/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
       
        let attackVC = AttackVC()
        attackVC.tabBarItem.title = "Attack"
        attackVC.tabBarItem.image = UIImage(named: "wifi")
        
       let scanVC = ScanVC()
        scanVC.tabBarItem.title = "Scan"
        scanVC.tabBarItem.image = UIImage(named: "scan")
        
        
        let viewControllerList = [attackVC, scanVC]
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
    
    
}
