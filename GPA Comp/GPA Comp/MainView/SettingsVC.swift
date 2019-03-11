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
    webView.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                   completionHandler: { (html: Any?, error: Error?) in
                                    print(html)
        })
        
        self.webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)

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
        
        print(webView.url)
        
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.url) {
            print("### URL:", self.webView.url!)
        }
        
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            // When page load finishes. Should work on each page reload.
            if (self.webView.estimatedProgress == 1) {
                print("### EP:", self.webView.estimatedProgress)
                var temp = ""
                webView.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                           completionHandler: { (html: Any?, error: Error?) in
                                            temp = (html as? String)!
                                            print(temp)
                                            
                                            if temp.contains("Cumulative GPA GPA (Q3)") {
                                                print("yuh")
                                            }
                                            if let gpaIndex = temp.index(of: "GPA (Q3):") {
                                                //let distance = word1.distance(from: word1.startIndex, to: indexC)
                                                //let substring = temp[index..<String.Index(Int(index)+5)]   // ab
                                                //let string = String(substring)
                                                //print(string)  // "ab\n"
                                                
                                                let StartIndex = temp.index(gpaIndex, offsetBy: 10)
                                                let EndIndex = temp.index(StartIndex, offsetBy: 5)
                                                let rangeOfDomain = StartIndex ..< EndIndex
                                                print("rand rand" + temp[rangeOfDomain])
                                                
                                                let yuh = String(temp[rangeOfDomain])
                                                
                                                //GPA
                                                AppData.sharedInstance.GPA = yuh
                                            }
                                            //Absences
                                            if let absencesIndex = temp.index(of: ">B<br>") {
                                                //let distance = word1.distance(from: word1.startIndex, to: indexC)
                                                //let substring = temp[index..<String.Index(Int(index)+5)]   // ab
                                                //let string = String(substring)
                                                //print(string)  // "ab\n"
                                                
                                                let StartIndex = temp.index(absencesIndex, offsetBy: 6)
                                                let EndIndex = temp.index(StartIndex, offsetBy: 2)
                                                let rangeOfDomain = StartIndex ..< EndIndex
                                                print("absences" + temp[rangeOfDomain])
                                                
                                                let yuh = String(temp[rangeOfDomain])
                                                
                                                //GPA
                                                AppData.sharedInstance.Absences = yuh
                                            }
                                            if let tardiesIndex = temp.index(of: "\"attendancedates.html?codes=*abs&amp;mode=ATT_ModeDaily\"") {
                                                //let distance = word1.distance(from: word1.startIndex, to: indexC)
                                                //let substring = temp[index..<String.Index(Int(index)+5)]   // ab
                                                //let string = String(substring)
                                                //print(string)  // "ab\n"
                                                
                                                let StartIndex = temp.index(tardiesIndex, offsetBy: 56)
                                                let EndIndex = temp.index(StartIndex, offsetBy: 2)
                                                let rangeOfDomain = StartIndex ..< EndIndex
                                                print("tardies" + temp[rangeOfDomain])
                                                
                                                let yuh = String(temp[rangeOfDomain])
                                                
                                                //GPA
                                                AppData.sharedInstance.Tardies = yuh
                                            }
                                        
                })
                
                
                
            
                
            }
        }
    }
    
}

extension StringProtocol where Index == String.Index {
    func index(of string: Self, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex(of string: Self, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes(of string: Self, options: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while start < endIndex,
            let range = self[start..<endIndex].range(of: string, options: options) {
                result.append(range.lowerBound)
                start = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    func ranges(of string: Self, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while start < endIndex,
            let range = self[start..<endIndex].range(of: string, options: options) {
                result.append(range)
                start = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
