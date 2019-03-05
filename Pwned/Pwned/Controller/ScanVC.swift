//
//  ScanVC.swift
//  Pwned
//
//  Created by Vlad Munteanu on 3/5/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//


import UIKit

class ScanVC: UIViewController {
    
    //Main View
    let scanView = ScanView()
    
    //buttons
   // unowned var sendWifiBttn: UIButton{return attackView.sendWifiButton}
    
    
    //Load dat VIEW
    public override func loadView() {
        self.view = scanView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sendWifiBttn.addTarget(self, action: #selector(sendWifi), for: UIControl.Event.touchUpInside)
        setupView()
        
    }
    
    func setupView() {
        self.title = "Scan 🕶"
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 8
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOut))
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(hamburgerMenuPressed))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
