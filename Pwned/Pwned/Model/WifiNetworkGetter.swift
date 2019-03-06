//
//  SSID.swift
//  Pwned
//
//  Created by Vlad Munteanu on 3/5/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

public class WifiNetworkGetter {
    
    class func amIPwned() -> Bool {
        if let interface = CNCopySupportedInterfaces() {
            for i in 0..<CFArrayGetCount(interface) {
                let interfaceName: UnsafeRawPointer = CFArrayGetValueAtIndex(interface, i)
                let rec = unsafeBitCast(interfaceName, to: AnyObject.self)
                if let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(rec)" as CFString), let interfaceData = unsafeInterfaceData as? [String : AnyObject] {
                    if let wifiName = interfaceData["SSID"] {
                        if(wifiName as! String == "pwned") {
                            print("pwn dat hoe")
                            return true
                        } else {
                             print("not pwned")
                        }
                        //print(wifiName)
                    }
                } else {
                    print("not connected to wifi")
                }
            }
        }
        return false
    }
}
