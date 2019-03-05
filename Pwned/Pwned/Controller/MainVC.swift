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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkWifiStatus()
    }
    func checkWifiStatus() {
        if SSID.amIPwned() == false {
            showWifiAlert()
        }
    }
    
    func showWifiAlert() {
        let alert = UIAlertController(title: "Not Connected", message: "Connect to Pwned wifi to continue", preferredStyle: UIAlertController.Style.alert)
        
//        alert.addAction(UIAlertAction(title: "Ok 👍🏼", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok 👍🏼", style: .default, handler: { (action) -> Void in
            self.checkWifiStatus()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func sendWifi() {
    
    }


}

