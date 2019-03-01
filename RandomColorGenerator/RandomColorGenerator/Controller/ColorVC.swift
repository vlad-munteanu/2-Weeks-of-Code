//
//  ViewController.swift
//  RandomColorGenerator
//
//  Created by Vlad Munteanu on 3/1/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
//import EZSwipeController

class ColorVC: UIViewController {
    
    //main view
    let colorView = ColorView()
    //random button
    unowned var randomButton: UIButton {return colorView.randomButton}
    
    public override func loadView() {
        self.view = colorView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.randomButton.addTarget(self, action: #selector(randomize), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc private func randomize() {
        //TODO: add code to randomize from device getting shaken 
    }

}

