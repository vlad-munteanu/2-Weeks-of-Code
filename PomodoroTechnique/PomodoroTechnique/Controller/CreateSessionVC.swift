//
//  CreateSessionVC.swift
//  PomodoroTechnique
//
//  Created by Vlad Munteanu on 3/4/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import UIKit
import CDAlertView

class CreateSessionVC: UIViewController {
    let newSessionView = NewSessionView()
    unowned var newSession: UIButton{return newSessionView.newSessionButton}
    
    public override func loadView() {
        self.view = newSessionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newSession.addTarget(self, action: #selector(presentAlert), for: UIControl.Event.touchUpInside)
      
    }
    
    
    @objc func presentAlert() {
        let alert = CDAlertView(title: "", message: "Enter Task Name",type: .alarm)
        alert.alertBackgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        alert.isTextFieldHidden = false
        let okAction = CDAlertViewAction(title: "Ok 👍🏼")
        alert.add(action: okAction)
        //alert.circleFillColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        alert.show() { (alert) in
            print("completed")
            print(alert.textFieldText)
            
            if let taskName = alert.textFieldText {
                self.createSession(sessionName: taskName)
            }
        }
    }
    
    func createSession(sessionName: String) {
    
    }
    
}
