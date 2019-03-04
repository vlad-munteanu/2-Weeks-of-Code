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
        okAction.buttonTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        alert.add(action: okAction)
        alert.show() { (alert) in
            print("completed")
            print(alert.textFieldText)
            
            if let taskName = alert.textFieldText {
                self.createSession(sessionName: taskName)
            }
        }
    }
    
    func createSession(sessionName: String) {
        let vc =  MainVC()
        vc.studySession.taskName = sessionName
        self.present(vc, animated: true, completion: nil)
    }
    
}
