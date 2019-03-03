//
//  ViewController.swift
//  SSHToMac
//
//  Created by Vlad Munteanu on 3/3/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import PVPMikrotikSSH

class MainVC: UIViewController, UITextFieldDelegate, NMSSHChannelDelegate {
    
    var longStringOfCommands = ""
    //Main View
    let mainView = MainView()
    
    var sessionCurrentlyConnected = false
    
    unowned var settingsButton: UIButton {return mainView.settingsButton}
    unowned var sendButton: UIButton {return mainView.sendCommandButton}
    
    
    
    public override func loadView() {
        self.view = mainView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.cmdTextfield.delegate = self
        
        self.settingsButton.addTarget(self, action: #selector(setup), for: UIControl.Event.touchUpInside)
        self.sendButton.addTarget(self, action: #selector(sendCommand), for: UIControl.Event.touchUpInside)
    }
    
    
    func channel(_ channel: NMSSHChannel!, didReadRawData data: Data!) {
        let str = String(data: data, encoding: .isoLatin1)!
        print("hello")
        print(str)
        longStringOfCommands = longStringOfCommands + "\n" + str
        mainView.commandLabel.text = longStringOfCommands
        let bottomOffset = CGPoint(x: 0, y: mainView.terminalView.contentSize.height - mainView.terminalView.bounds.size.height)
        mainView.terminalView.setContentOffset(bottomOffset, animated: true)
        
    }

    
    //TODO: Fix alertView to allow users to input credentials
    @objc func setup() {
        var alert = UIAlertController(title: "Login to SSH", message: "", preferredStyle: .alert)
        var ipTF: UITextField!
        var passTF: UITextField!
        var hostTF: UITextField!
        
        func configurationTextField(uTF: UITextField!, pTF: UITextField!, hTF: UITextField) {
            print("generating the TextField")
            uTF.placeholder = "Username"
            pTF.placeholder = "Password"
            hTF.placeholder = "Host"
        }
        
        //alert.addTextFieldsWithConfigurationHandler(configurationTextField)
        
       
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func sendCommand() {
        self.view.endEditing(true)
        if mainView.cmdTextfield.text == "" {
            notValidCommand(alertMessage: "Command Not Valid")
        } else {
            let command = mainView.cmdTextfield.text!
            longStringOfCommands = longStringOfCommands + "\n" + command
            mainView.commandLabel.text = longStringOfCommands
            //connect()
            newConnect(commandToRun: command)
            
        }
        print("send command")
    }
    
    func newConnect(commandToRun: String) {
        
        
      
        let session = NMSSHSession(host: host, andUsername: username)
        print("Trying to connect now..")
        session?.connect()
        if session?.isConnected == true
        {
            print("Session connected")
            session?.channel.delegate = self
            session?.channel.ptyTerminalType = .vanilla
            session?.channel.requestPty = true
            session?.authenticate(byPassword:password)
            
            do{
                try session?.channel.startShell()
                let a = try session?.channel.write(commandToRun + "\n")
                print(a)
                print(session?.channel.lastResponse ?? "no respone of last command")
                longStringOfCommands = longStringOfCommands + "\n" + String(session?.channel.lastResponse ?? "no respone of last command")
                mainView.commandLabel.text = longStringOfCommands
            }catch{
                print("Error ocurred!!")
            }
            
            //For other types
            //session.authenticateByPassword(password)
        }
        //session?.disconnect()
    }
    
    
    func notValidCommand(alertMessage: String) {
        let alert = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in }))
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

