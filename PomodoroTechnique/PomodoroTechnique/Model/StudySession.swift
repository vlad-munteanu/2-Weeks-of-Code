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
    var secondsPerNormalBreak = 300
    var secondsPerLastBreak = 1500
    
    var timerIsRunning = false
    var timerIsPaused = false
    var timer = Timer()
    var taskName = String()
    
    var airplaneMode = true
    
    
    
    init() {
        checkifAirplaneMode()
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
    
    func checkifAirplaneMode() -> String {
        let reachability =  InternetReachability()!
        var returnValue = ""
        
        if reachability.connection != .none {
            airplaneMode = false
            if reachability.connection == .wifi {
                DispatchQueue.main.async {
                    print("wifi connected")
                    returnValue = "Wifi"
                }
            } else {
                DispatchQueue.main.async {
                    print("Cellular connected")
                    returnValue = "Cellular Data"
                }
            }
        } else {
            print("No Internet connection!")
            returnValue = ""
        }
        
        return returnValue
    }
}
