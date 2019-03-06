//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Vlad Munteanu on 3/6/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class InputSpeechVC: UIViewController {

    let inputSpeechView = InputView()
    
    public override func loadView() {
        self.view = inputSpeechView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.title = "Text 2 Speech"
        self.navigationController?.navigationBar.layer.masksToBounds = false
        
        let rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveSpeech))
        rightBarButtonItem.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "menu"), style: .done    , target: self, action: #selector(hamburgerMenuPressed))
    }
    
    @objc func saveSpeech() {
        
    }

}
