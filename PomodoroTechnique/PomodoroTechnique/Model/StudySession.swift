//
//  StudySession.swift
//  PomodoroTechnique
//
//  Created by Vlad Munteanu on 3/4/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation

class StudySession {
    
    var numberOfStudySessionsLeft = 4
    var secondsPerSession = 1500
    var timerIsRunning = false
    var timerIsPaused = false
    var timer = Timer()
    var taskName = String()
    
    
    
    init() {
        
    }
    
    func changeMode() {
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        secondsPerSession -= 1
        //TODO: Update timer label
        
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
}
