//
//  ViewController.swift
//  RandomColorGenerator
//
//  Created by Vlad Munteanu on 3/1/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    //main view
    let main = MainView()
    //random button
    unowned var randomButton: UIButton {return main.randomButton}
    
    public override func loadView() {
        self.view = main
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.randomButton.addTarget(self, action: #selector(randomize), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc private func randomize() {
        //TODO: add code to randomize from device getting shaken 
    }

}

