//
//  ViewController.swift
//  RandomColorGenerator
//
//  Created by Vlad Munteanu on 3/1/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
//import EZSwipeController

class ColorVC: UIViewController {
    
    //main view
    let colorView = ColorView()
    //random button
    unowned var randomButton: UIButton {return colorView.randomButton}
    
    
    public override func loadView() {
        self.view = colorView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        self.randomButton.addTarget(self, action: #selector(randomize), for: UIControl.Event.touchUpInside)
       
        
    }
  
    //Randomize Color
    @objc private func randomize() {
        let backColor: UIColor = .random()
        //hexLabel.text = "Hex Code: " + tempNewColor.toHexString()
        colorView.hexLabel.textColor = .random()
        colorView.hexLabel.text = backColor.toHexString()
        colorView.hexLabel.shadowColor = .random()
        print(backColor.toHexString())
        
        colorView.currentHexCode = backColor.toHexString()
        
        //rgbLabel.text = "RGB: " + tempNewColor.toRGB()
        colorView.rgbLabel.textColor = .random()
        colorView.rgbLabel.text = backColor.toRGB()
        colorView.rgbLabel.shadowColor = .random()
        print(backColor.toRGB())
        
        colorView.backgroundView.backgroundColor = backColor
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("Why are you shaking me?")
            randomize()
        }
    }

}

//random color generator

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        
        return UIColor(red: .random(),
                       green: .random(),
                       blue: .random(),
                       alpha: 1.0)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format:"#%06x", rgb) as String
    }
    
    func toRGB() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let red: String = String((Int)(r*255))
        let green: String = "," + String((Int)(g*255))
        let blue: String = "," + String((Int)(b*255))
        
        let rgb: String = red + green + blue
        
        
        return rgb
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
}




