//
//  SettingsVC.swift
//  SSHToMac
//
//  Created by Vlad Munteanu on 3/3/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    //Main View
    let settingsView = SettingsView()
    
    public override func loadView() {
        self.view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
