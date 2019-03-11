//
//  SettingsVC.swift
//  GPA Comp
//
//  Created by Vlad Munteanu on 3/11/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class SettingsVC: UIViewController, WKNavigationDelegate {
    
    var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        self.title = "Settings"
        self.navigationController?.navigationBar.layer.masksToBounds = false
        
        let web = "https://ps.fccps.org/public/"
        let url = NSURL(string: web)
        let request = NSURLRequest(url: url! as URL)
        
        // init and load request in webview.
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        self.view.addSubview(webView)
        self.view.sendSubviewToBack(webView)
    }
    
}
