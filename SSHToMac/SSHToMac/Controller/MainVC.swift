//
//  ViewController.swift
//  SSHToMac
//
//  Created by Vlad Munteanu on 3/3/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    //Main View
    let mainView = MainView()
    
    public override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.cmdTextfield.delegate = self
    }
    
    //dismisses keyboard when user touches screen elsewhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    


}

