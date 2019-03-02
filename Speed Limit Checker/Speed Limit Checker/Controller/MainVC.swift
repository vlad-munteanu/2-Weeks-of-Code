//
//  MainVC.swift
//  Speed Limit Checker
//
//  Created by Vlad Munteanu on 3/2/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    //main view
    let mainView = MainView()
    
    public override func loadView() {
        self.view = mainView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
