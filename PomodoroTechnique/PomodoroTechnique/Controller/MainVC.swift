//
//  ViewController.swift
//  PomodoroTechnique
//
//  Created by Vlad Munteanu on 3/4/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import CDAlertView

class MainVC: UIViewController {

    //main View
    let timerView = MainTimerView()
    
    //model
    let studySession = StudySession()
    
    
    //buttons
    unowned var startPausebutton: UIButton{return timerView.startPauseButton}
    unowned var cancelButton: UIButton{return timerView.cancelButton}
    
    //timer
    var timer = Timer()
    
    public override func loadView() {
        self.view = timerView
        timerView.tasknameLabel.text = studySession.taskName
        timerView.sessionNumberLabel.text = "# of Sessions Left: \(studySession.numberOfStudySessionsLeft)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startPausebutton.addTarget(self, action: #selector(startOrPauseTimer), for: UIControl.Event.touchUpInside)
        self.cancelButton.addTarget(self, action: #selector(cancelSession), for: UIControl.Event.touchUpInside)
    }
    
    
    
    
    @objc func startOrPauseTimer() {
        print(timerView.startPauseButton.titleLabel!.text)
        if timerView.startPauseButton.titleLabel!.text == "Start" {
            timerView.startPauseButton.setTitle("Pause", for: UIControl.State.normal)
            studySession.timerIsPaused = false
            runTimer()
        } else {
            timerView.startPauseButton.setTitle("Start", for: UIControl.State.normal)
            studySession.timerIsPaused = true
            timer.invalidate()
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if(studySession.numberOfStudySessionsLeft > 0) {
            if(studySession.currentMode == "Study") {
                if(studySession.secondsPerSession > 1) {
                    studySession.secondsPerSession -= 1
                    timerView.timerLabel.text = studySession.timeString(time: TimeInterval(studySession.secondsPerSession))
                } else {
                    studySession.changeMode()
                    timerView.currentModeLabel.text = studySession.currentMode + " Mode"
                }
            } else if(studySession.currentMode == "Break") {
                if(studySession.secondsPerNormalBreak > 1) {
                    studySession.secondsPerNormalBreak -= 1
                    timerView.timerLabel.text = studySession.timeString(time: TimeInterval(studySession.secondsPerNormalBreak))
                } else {
                    studySession.changeMode()
                    timerView.currentModeLabel.text = studySession.currentMode + " Mode"
                }
            }
        } else if (studySession.numberOfStudySessionsLeft == 0) {
            if(studySession.secondsPerLastBreak > 1) {
                studySession.secondsPerLastBreak -= 1
                timerView.currentModeLabel.text = studySession.currentMode + " Mode"
                timerView.timerLabel.text = studySession.timeString(time: TimeInterval(studySession.secondsPerLastBreak))
            } else {
                continueAlert()
            }
        }
    }
    
    func continueAlert() {
        let alert = CDAlertView(title: "", message: "Do you want to continue working on this task?",type: .notification)
        alert.alertBackgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        let yesAction = CDAlertViewAction(title: "Yes",
                                          font: UIFont.systemFont(ofSize: 17),
                                          textColor: #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1),
                                          backgroundColor: nil,
                                          handler: { action in
                                            self.studySession.reset()
                                            return true
        })
        
        alert.add(action: yesAction)
        
        let noAction = CDAlertViewAction(title: "No")
        noAction.buttonTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        alert.add(action: noAction)
        
        alert.show()
    }
    
    @objc func cancelSession() {
        let alert = CDAlertView(title: "", message: "Are you sure you want to exit this current study session?",type: .warning)
        alert.alertBackgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        let yesAction = CDAlertViewAction(title: "Yes",
                                           font: UIFont.systemFont(ofSize: 17),
                                           textColor: #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1),
                                           backgroundColor: nil,
                                           handler: { action in
                                            self.gobackHome()
                                            return true
        })
        
        alert.add(action: yesAction)
       
        let noAction = CDAlertViewAction(title: "No")
        noAction.buttonTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        alert.add(action: noAction)
        
        alert.show()
    }
    
    func gobackHome() {
        let vc =  CreateSessionVC()
        self.present(vc, animated: true, completion: nil)
    }
    
}

