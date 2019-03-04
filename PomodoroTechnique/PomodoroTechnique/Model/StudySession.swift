//
//  StudySession.swift
//  PomodoroTechnique
//
//  Created by Vlad Munteanu on 3/4/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import UIKit
import CDAlertView

class StudySession {
    
    var numberOfStudySessionsLeft = 4
    
    var secondsPerSession = 1500
    var secondsPerNormalBreak = 300
    var secondsPerLastBreak = 1500
    
    var timerIsRunning = false
    var timerIsPaused = false
    var taskName = String()
    
    var airplaneMode = true
    
    
    
    init() {
        checkifAirplaneMode()
    }
    
    func changeMode() {
        
    }
    
    
    
    func checkifAirplaneMode() {
        let reachability =  InternetReachability()!
        
        if reachability.connection != .none {
            airplaneMode = false
            if reachability.connection == .wifi {
                DispatchQueue.main.async {
                    print("wifi connected")
                    self.airplaneAlert(wifiLabel: "Wifi")
                }
            } else {
                DispatchQueue.main.async {
                    print("Cellular connected")
                    self.airplaneAlert(wifiLabel: "Cellular Data")
                }
            }
        } else {
            print("No Internet connection!")
        }
    }
    
    func airplaneAlert(wifiLabel: String) {
        let alert = CDAlertView(title: "\(wifiLabel) Enabled", message: "Turn on airplane mode to focus better.",type: .warning)
        alert.alertBackgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        let yesAction = CDAlertViewAction(title: "Ok 👍🏼")
        yesAction.buttonTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        alert.add(action: yesAction)
        
        alert.show()
    }
    
}
