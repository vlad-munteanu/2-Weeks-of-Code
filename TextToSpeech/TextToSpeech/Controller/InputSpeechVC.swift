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
    
    
    //button
    unowned var speakBttn: UIButton { return inputSpeechView.speakButton}
    
    
    //textfield
    unowned var textfield: UITextField { return inputSpeechView.textTF}
    
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
        speakBttn.addTarget(self, action: #selector(speakText), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func saveSpeech() {
        if let sentence = textfield.text {
            savedStrings.append(sentence)
        }
        textfield.text = ""
        print(savedStrings)
    }
    
    @objc func speakText() {
        if let sentence = textfield.text {
            SpeakerModel.speak(stringToSpeak: sentence)
        }
        textfield.text = ""
    }

}

