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
    
    //TODO: Create Constraints
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
            make.bottom.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    func updateBackgroundColor() {
        let tempNewColor: UIColor = .random()
        hexLabel.text = "Hex Code: " + tempNewColor.toHexString()
        print(tempNewColor.toHexString())
        
        backgroundView.backgroundColor = tempNewColor
        
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
        
        //TODO: Make sure font scales
        hexlabel.font = UIFont(name: "System", size: 40)
        hexlabel.text = "Hex Code = "
        hexlabel.translatesAutoresizingMaskIntoConstraints = false
        return hexlabel
    }()
    
    internal let rgbLabel: UILabel =  {
        let rgblabel = UILabel()
        rgblabel.font = UIFont(name: "System", size: 35)
        rgblabel.text = "RGB Code = "
        rgblabel.translatesAutoresizingMaskIntoConstraints = false
        return rgblabel
    }()
    
    //Button
    public let randomButton: UIButton = {
        let randButton = UIButton()
        randButton.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        randButton.titleLabel?.text = "New Color"
        randButton.backgroundColor = #colorLiteral(red: 0.07459209753, green: 1, blue: 0.07377539981, alpha: 1)
        return randButton
    }()
}

//random color generator

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

//TODO: Return Hex number and rgb color of UIColor
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
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

}


