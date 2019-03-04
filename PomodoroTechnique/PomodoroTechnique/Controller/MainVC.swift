//
//  ViewController.swift
//  PomodoroTechnique
//
//  Created by Vlad Munteanu on 3/4/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    //main View
    let timerView = MainTimerView()
    
    //model
    let studySession = StudySession()
    
    //buttons
    unowned var startbutton: UIButton{return timerView.startButton}
    unowned var pauseButton: UIButton{return timerView.pauseButton}
    
    
    
    
    public override func loadView() {
        self.view = timerView
        timerView.tasknameLabel.text = studySession.taskName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startbutton.addTarget(self, action: #selector(startTimer), for: UIControl.Event.touchUpInside)
        self.startbutton.addTarget(self, action: #selector(pauseTimer), for: UIControl.Event.touchUpInside)
    }
    
    @objc func startTimer() {
        studySession.runTimer()
    }
    
    @objc func pauseTimer() {
        if(studySession.timerIsPaused == true) {
             studySession.pauseTimer()
        } else {
            
        }
    }


}

