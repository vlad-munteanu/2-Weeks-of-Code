//
//  StudySession.swift
//  PomodoroTechnique
//
//  Created by Vlad Munteanu on 3/4/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation

class StudySession {
    
    var numberOfStudySessions = 4
    var secondsPerSession = 1500
    var timerIsRunning = false
    var timer = Timer()
    
    
    init() {
        
    }
    
    func changeMode() {
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
    }
    
}
