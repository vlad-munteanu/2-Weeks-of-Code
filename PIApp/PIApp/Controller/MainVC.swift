//
//  ViewController.swift
//  PIApp
//
//  Created by Vlad Munteanu on 3/14/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    //main view
    let mainView = MainView()
    //random button
   // unowned var randomButton: UIButton {return colorView.randomButton}
    
    
    public override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

