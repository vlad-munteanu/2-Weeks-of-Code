//
//  ViewController.swift
//  SSHButton
//
//  Created by Vlad Munteanu on 3/10/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import CDAlertView
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    //AW stuff
    var session : WCSession!
    //View
    let mainView = MainView()
    
    //Button
    unowned var newCommand: UIButton{return mainView.setCommandButton}
    
    public override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newCommand.addTarget(self, action: #selector(presentCommandAlert), for: UIControl.Event.touchUpInside)
    }
    
    @objc func presentCommandAlert() {
        let alert = CDAlertView(title: "", message: "Enter Command",type: .alarm)
        alert.alertBackgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        alert.isTextFieldHidden = false
        let okAction = CDAlertViewAction(title: "Ok 👍🏼")
        okAction.buttonTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        alert.add(action: okAction)
        alert.show() { (alert) in
            print("completed")
            print(alert.textFieldText)
            
            if let commandName = alert.textFieldText {
                self.mainView.commandLabel.text = commandName
            }
        }
    }
    
    func watchConnectionStatus(){
        
        print("isPaired",session.isPaired)
        print("session.isWatchAppInstalled",session.isWatchAppInstalled)
        print(session.watchDirectoryURL as Any)
        
    }
    
   


}


extension ViewController {
    @available(iOS 9.3, *)
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
        watchConnectionStatus()
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        let message = message["message"] as! String
        print(message)
        
        playCatNoise()
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    //    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
    //
    //
    //
    //
    //    }
}


