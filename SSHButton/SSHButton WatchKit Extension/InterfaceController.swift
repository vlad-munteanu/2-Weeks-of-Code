//
//  InterfaceController.swift
//  SSHButton WatchKit Extension
//
//  Created by Vlad Munteanu on 3/10/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    var session : WCSession!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if WCSession.isSupported() {
            
            session = WCSession.default
            session.delegate = self
            session.activate()
            
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func isReachable() -> Bool {
        return session.isReachable
    }
    
    @IBAction func sendDatCommand() {
        session.sendMessage(["message":"trigger Command"], replyHandler: nil, errorHandler: nil)
    }
    
}

extension InterfaceController {
    
    // 4: Required stub for delegating session
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }
    
}

