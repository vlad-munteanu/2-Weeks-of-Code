//
//  MainView.swift
//  RandomColorGenerator
//
//  Created by Vlad Munteanu on 3/1/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SnapKit

public class ColorView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect.zero
        
        intializeUI()
        createConstraints()
        updateBackgroundColor()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func intializeUI() {
        addSubview(backgroundView)
        addSubview(hexLabel)
        addSubview(rgbLabel)
        addSubview(randomButton)
    }
    
    internal func createConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        hexLabel.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.05)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.75)
        }
        rgbLabel.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.05)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalToSuperview()
            make.top.equalTo(hexLabel.snp_bottom).offset(20)
        }
        randomButton.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.45)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.9)
        }
    }
    
    func updateBackgroundColor() {
        let backColor: UIColor = .random()
       
        
        //hexLabel.text = "Hex Code: " + tempNewColor.toHexString()
        hexLabel.textColor = .random()
        hexLabel.text = backColor.toHexString()
        hexLabel.shadowColor = .random()
        print(backColor.toHexString())
        
        //rgbLabel.text = "RGB: " + tempNewColor.toRGB()
        rgbLabel.textColor = .random()
        rgbLabel.text = backColor.toRGB()
        rgbLabel.shadowColor = .random()
        print(backColor.toRGB())
        
        backgroundView.backgroundColor = backColor
        
    }
    
    
    //Main Background Subview
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return backgroundView
    }()
    
    
    //Just Two Labels
    internal let hexLabel: UILabel = {
        let hexlabel = UILabel()
        
        hexlabel.font = UIFont(name: "Futura", size: 40)
        hexlabel.numberOfLines = 1
        hexlabel.minimumScaleFactor = 0.5
        hexlabel.shadowOffset = CGSize(width: -3, height: 2)
        hexlabel.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        hexlabel.adjustsFontSizeToFitWidth = true
        hexlabel.textAlignment = .center
        hexlabel.translatesAutoresizingMaskIntoConstraints = false
        return hexlabel
    }()
    
    internal let rgbLabel: UILabel =  {
        let rgblabel = UILabel()
        rgblabel.font = UIFont(name: "Futura", size: 40)
        rgblabel.numberOfLines = 1
        rgblabel.minimumScaleFactor = 0.5
        rgblabel.shadowOffset = CGSize(width: -3, height: 2)
        rgblabel.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        rgblabel.adjustsFontSizeToFitWidth = true
        rgblabel.textAlignment = .center
        rgblabel.translatesAutoresizingMaskIntoConstraints = false
        return rgblabel
    }()
    
    //Button
    public let randomButton: UIButton = {
        let randButton = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        randButton.setTitle("Randomize", for: UIControl.State.normal)
        randButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        randButton.backgroundColor = UIColor.clear
        randButton.layer.borderWidth = 1.0
        randButton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        randButton.layer.cornerRadius = cornerRadius
        
        return randButton
    }()
    
    public let saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.titleLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        saveButton.titleLabel?.text = "New Color"
        saveButton.backgroundColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        return saveButton
    }()
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


