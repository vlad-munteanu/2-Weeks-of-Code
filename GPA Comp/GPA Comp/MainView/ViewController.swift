//
//  ViewController.swift
//  GPA Comp
//
//  Created by Vlad Munteanu on 3/11/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    let mainView = MainView()
    
    public override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.value(forKey: "username") == nil {
            showAlert()
        }
    }
    
    func showAlert() {
        
        let alertController = UIAlertController(title: "Not Logged In", message: "Enter PS Username and Password to Login", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "OK", style: .default, handler: {
            alert -> Void in
            
            let usernameTF = alertController.textFields![0] as UITextField
            let passwordTF = alertController.textFields![1] as UITextField
            
            if usernameTF.text != "" || passwordTF.text != ""{
                PowerschoolInfo.setUpAuth(url: URL(string: "https://ps.fccps.org/public/home.html")!,username: usernameTF.text!, password: passwordTF.text!)
            }else{
               print("nil")
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Username"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Password"
            textField.isSecureTextEntry = true
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

