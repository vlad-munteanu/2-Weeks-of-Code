//
//  ScanWKVC.swift
//  Pwned
//
//  Created by Vlad Munteanu on 3/5/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class ScanWKVC: UIViewController, WKNavigationDelegate {
    
    var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         setupView()
    }
    
    func setupView() {
        self.title = "Scan 🕶"
        self.navigationController?.navigationBar.layer.masksToBounds = false
        
        let ssids = "http://192.168.4.1/scan.html"
        let url = NSURL(string: ssids)
        let request = NSURLRequest(url: url! as URL)
        
        // init and load request in webview.
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        self.view.addSubview(webView)
        self.view.sendSubviewToBack(webView)
    }
}
