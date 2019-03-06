//
//  ViewController.swift
//  Pwned
//
//  Created by Vlad Munteanu on 3/5/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class AttackVC: UIViewController {

    //TODO: Fix Wifi Alert when app enters foreground
    //Main View
    let attackView = AttackView()
    
    //buttons
    unowned var attackBttn: UIButton{return attackView.attackButton}
    
    
    //Load dat VIEW
    public override func loadView() {
        self.view = attackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       attackBttn.addTarget(self, action: #selector(attackDatWifi), for: UIControl.Event.touchUpInside)
        setupView()
        attackView.activityIndicator.startAnimating()
       
    }
    
    func setupView() {
        self.title = "Hack That Wifi ☠️"
        self.navigationController?.navigationBar.layer.masksToBounds = false
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOut))
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(hamburgerMenuPressed))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkWifiStatus()
    }
    func checkWifiStatus() {
        attackView.activityIndicator.removeFromSuperview()
        if WifiNetworkGetter.amIPwned() == false {
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
    
    @objc func attackDatWifi() {
        WifiDeauth.attackNetwork(URL(string: "http://192.168.4.1/attack.html")!)
        attackView.networkLabel.text = "Attacking Selected Wifi"
    }
}

