//
//  ViewController.swift
//  Pwned
//
//  Created by Vlad Munteanu on 3/5/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    //Main View
    let mainView = MainView()
    
    //buttons
    unowned var sendWifiBttn: UIButton{return mainView.sendWifiButton}
    
    
    //Load dat VIEW
    public override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendWifiBttn.addTarget(self, action: #selector(sendWifi), for: UIControl.Event.touchUpInside)
        print(SSID.printCurrentWifiInfo())
        
    }
    
    @objc func sendWifi() {
    
    }


}

