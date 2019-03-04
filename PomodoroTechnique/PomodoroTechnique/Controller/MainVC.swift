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
    unowned var startPausebutton: UIButton{return timerView.startPauseButton}
    unowned var cancelButton: UIButton{return timerView.cancelButton}
    
    
    
    
    public override func loadView() {
        self.view = timerView
        timerView.tasknameLabel.text = studySession.taskName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startPausebutton.addTarget(self, action: #selector(startTimer), for: UIControl.Event.touchUpInside)
        self.cancelButton.addTarget(self, action: #selector(cancelSession), for: UIControl.Event.touchUpInside)
    }
    
    @objc func startTimer() {
        studySession.runTimer()
    }
    
    @objc func cancelSession() {
        //popup to cancel 
    }
    
    @objc func pauseTimer() {
        if(studySession.timerIsPaused == true) {
             studySession.pauseTimer()
        } else {
            
        }
    }


}

