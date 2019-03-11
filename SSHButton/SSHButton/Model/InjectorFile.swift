//
//  InjectorFile.swift
//  SSHButton
//
//  Created by Vlad Munteanu on 3/10/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

extension UIViewController { //5
    
    #if DEBUG //1
    @objc func injected() { //2
        for subview in self.view.subviews { //3
            subview.removeFromSuperview()
        }
        
        viewDidLoad() //4
    }
    #endif
}
