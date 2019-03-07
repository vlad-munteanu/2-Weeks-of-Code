//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Vlad Munteanu on 3/6/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import HSPopupMenu

class InputSpeechVC: UIViewController, UITextFieldDelegate {

    let inputSpeechView = InputView()
    
    var menuArray: [HSMenu] = []
    
    var voiceStrings = ["Karen (Australia)", "Daniel (UK)", "Moira (Ireland)", "Tessa (S Africa)","Siri (US)"]
    
    
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
        setupMenu()
    }
    
    func setupMenu() {
        let menu1 = HSMenu(icon: nil, title: "Karen (Australia)")
        let menu2 = HSMenu(icon: nil, title: "Daniel (UK)")
        let menu3 = HSMenu(icon: nil, title: "Moira (Ireland)")
        let menu4 = HSMenu(icon: nil, title: "Tessa (S Africa)")
        let menu5 = HSMenu(icon: nil, title: "Siri (US)")
        
        menuArray = [menu1, menu2, menu3, menu4, menu5]
    }
    
    func setupView() {
        self.title = "Text 2 Speech"
        self.navigationController?.navigationBar.layer.masksToBounds = false
        textfield.delegate = self
        
        let rightBarButtonItem = UIBarButtonItem(title: "Set Voice", style: .plain, target: self, action: #selector(presentNameMenu))

        rightBarButtonItem.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem

        let leftBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveSpeech))
        leftBarButtonItem.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        speakBttn.addTarget(self, action: #selector(speakText), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func presentNameMenu() {
        let popupMenu = HSPopupMenu(menuArray: menuArray, arrowPoint: CGPoint(x: UIScreen.main.bounds.width-35, y: 60))
        popupMenu.popUp()
        popupMenu.delegate = self
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
    
    //dismisses keyboard when user touches screen elsewhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        speakText()
        return false
    }

}

extension InputSpeechVC: HSPopupMenuDelegate {
    func popupMenu(_ popupMenu: HSPopupMenu, didSelectAt index: Int) {
        print("selected index is: " + "\(index)")
        SpeakerModel.setVoice(name: voiceStrings[index])
    }
}

