//
//  AppData.swift
//  GPA Comp
//
//  Created by Vlad Munteanu on 3/11/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation

public class AppData {
    private let userDefaults: UserDefaults
    public static var sharedInstance = AppData(userDefaults: UserDefaults.standard)
    
    public var GPA: String? {
        get {
            return self.userDefaults.string(forKey: "GPA")
        }
        set {
            self.userDefaults.set(newValue, forKey: "GPA")
            self.userDefaults.synchronize()
        }
    }
    
    public var Absences: String? {
        get {
            return self.userDefaults.string(forKey: "Absences")
        }
        set {
            self.userDefaults.set(newValue, forKey: "Absences")
            self.userDefaults.synchronize()
        }
    }
    
    public var Tardies: String? {
        get {
            return self.userDefaults.string(forKey: "Tardies")
        }
        set {
            self.userDefaults.set(newValue, forKey: "Tardies")
            self.userDefaults.synchronize()
        }
    }
    
    public var username: String? {
        get {
            return self.userDefaults.string(forKey: "username")
        }
        set {
            self.userDefaults.set(newValue, forKey: "username")
            self.userDefaults.synchronize()
        }
    }
    
    public var password: String? {
        get {
            return self.userDefaults.string(forKey: "password")
        }
        set {
            self.userDefaults.set(newValue, forKey: "password")
            self.userDefaults.synchronize()
        }
    }
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
}
