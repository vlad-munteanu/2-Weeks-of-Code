//
//  ViewController.swift
//  SSHToMac
//
//  Created by Vlad Munteanu on 3/3/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import SwiftSH

class MainVC: UIViewController, UITextFieldDelegate {
    
    var longStringOfCommands = ""
    //Main View
    let mainView = MainView()
    
    var myUsername = ""
    var myPassword = ""
    var myHost = ""
    
    unowned var settingsButton: UIButton {return mainView.settingsButton}
    unowned var sendButton: UIButton {return mainView.sendCommandButton}
    
    
    
    public override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.cmdTextfield.delegate = self
        
        self.settingsButton.addTarget(self, action: #selector(setup), for: UIControl.Event.touchUpInside)
        self.sendButton.addTarget(self, action: #selector(sendCommand), for: UIControl.Event.touchUpInside)
    }
    
    //TODO: Fix alertView to allow users to input credentials
    @objc func setup() {
        let alert = UIAlertController(title: "Login", message: "Need to login to SSH", preferredStyle: .alert)
        let ipTF = UITextField()
        let passTF = UITextField()
        let hostTF = UITextField()
        
        alert.addTextField(configurationHandler: { (textField) in
            ipTF.placeholder = "Enter Username"
            
        })
        alert.addTextField(configurationHandler: { (textField) in
            hostTF.placeholder = "Enter Hostname"
        })
        alert.addTextField(configurationHandler: { (textField) in
            passTF.placeholder = "Enter Password"
        })
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func sendCommand() {
        self.view.endEditing(true)
        if mainView.cmdTextfield.text == "" {
            notValidCommand(alertMessage: "Command Not Valid")
        } else {
            connect()
            let command = mainView.cmdTextfield.text!
            longStringOfCommands = longStringOfCommands + "\n" + command
            mainView.commandLabel.text = longStringOfCommands
            connect()
        }
        print("send command")
    }
    func connect() {
        let shell = Shell(host: myHost, port: 22)
        // ...
        shell!.withCallback { (string: String?, error: String?) in
            print("\(string ?? error!)")
            }
            .connect()
            .authenticate(.byPassword(username: myUsername, password: myPassword))
            .open { (error) in
                if let error = error {
                    print("\(error)")
                }
        }
        // ...
        shell!.write("Say 'yuh'") { (error) in
            if let error = error {
                print("error")
                print("\(error)")
            }
        }
        
//        let command = Command(host: "localhost", port: 22)
//        // ...
//        command!.connect().authenticate(.byPassword(username: "username", password: "password")).execute(command) { (command, result: String?, error) in
//                if let result = result {
//                    print("\(result)")
//                } else {
//                    print("ERROR: \(error)")
//                }
//        }
        
    }
    
    func notValidCommand(alertMessage: String) {
        let alert = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    //dismisses keyboard when user touches screen elsewhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    


}

