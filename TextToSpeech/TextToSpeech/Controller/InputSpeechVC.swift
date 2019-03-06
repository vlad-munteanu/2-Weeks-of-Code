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
    }


}

