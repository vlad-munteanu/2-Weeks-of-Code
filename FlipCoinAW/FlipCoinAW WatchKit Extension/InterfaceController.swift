//
//  InterfaceController.swift
//  FlipCoinAW WatchKit Extension
//
//  Created by Vlad Munteanu on 3/12/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import WatchKit
import Foundation
import UIKit


class InterfaceController: WKInterfaceController {
    @IBOutlet var coinImage: WKInterfaceImage!
    
    
    @IBAction func flipPressed() {
        let headsTails = Int(arc4random_uniform(2))
        coinImage.setImageNamed("coin")
        
        
       // self.coinImage.setImageNamed("coin10")
        
        if headsTails == 1 {
            coinImage.startAnimatingWithImages(in: NSMakeRange(0,11), duration: 2.0, repeatCount: 1)
            
        } else {
           coinImage.startAnimatingWithImages(in: NSMakeRange(0,6), duration: 2.5, repeatCount: 1)
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.coinImage.stopAnimating()
//            if headsTails == 1 {
//                self.coinImage.setImageNamed("coin10")
//
//            } else {
//                self.coinImage.stopAnimating()
//                 self.coinImage.setImageNamed("coin5")
//            }
//        }
    }
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
