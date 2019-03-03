//
//  SSHManager.swift
//  SSHToMac
//
//  Created by Vlad Munteanu on 3/3/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import PVPMikrotikSSH

class SSHManager {
    private var pvpManager: PVPSSHManager
    static let defaultHost = "192.168.88.1"
    
    init(host: String, userName: String, password: String?) {
        
        pvpManager = PVPSSHManager(host: host, userName: userName, password: password)
    }
    
    convenience init() {
        self.init(host: SSHManager.defaultHost, userName: "admin", password: "")
    }
    
    func initiateConnection(completion: ((_ success: Bool) -> Void)?) {
        
        pvpManager.connectSessionAndAuthorize {(error) in
            
            if let sessionError = error {
                switch sessionError {
                case .noPassword:
                    print("Session not connected: No password")
                    
                    completion?(false)
                case .notConnected:
                    print("Session not connected")
                    
                    completion?(false)
                    
                case .notAuthorized:
                    print("Session not authorized")
                    
                    completion?(false)
                    
                default:
                    //there are few more types of errors just use them if you need
                    print("Session is not connected")
                    completion?(false)
                }
            }else{
                print("Session connected")
                completion?(true)
            }
        }
    }
}
