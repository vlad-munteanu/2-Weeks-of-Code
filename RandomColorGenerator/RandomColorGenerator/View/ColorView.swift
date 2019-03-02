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
    
    public var currentHexCode: String = ""
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect.zero
        
        intializeUI()
        createConstraints()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func intializeUI() {
        addSubview(backgroundView)
        addSubview(hexLabel)
        addSubview(rgbLabel)
        addSubview(randomButton)
        addSubview(saveButton)
    }
    
    internal func createConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        hexLabel.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.07)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.75)
        }
        rgbLabel.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.07)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.top.equalTo(hexLabel.snp_bottom).offset(20)
        }
        randomButton.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.45)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.9)
        }
        saveButton.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.05)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.right.equalToSuperview().multipliedBy(0.95)
            make.centerY.equalToSuperview().multipliedBy(0.2)
        }
    }
    
    
    
    //Main Background Subview
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return backgroundView
    }()
    
    
    //Just Two Labels
    public let hexLabel: UILabel = {
        let hexlabel = UILabel()
        
        hexlabel.font = UIFont(name: "Futura", size: 48)
        hexlabel.numberOfLines = 1
        hexlabel.minimumScaleFactor = 0.5
        hexlabel.shadowOffset = CGSize(width: -3, height: 2)
        hexlabel.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        hexlabel.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        hexlabel.text = hexlabel.textColor.toHexString()
        
        hexlabel.adjustsFontSizeToFitWidth = true
        hexlabel.textAlignment = .center
        hexlabel.translatesAutoresizingMaskIntoConstraints = false
        return hexlabel
    }()
    
    public let rgbLabel: UILabel =  {
        let rgblabel = UILabel()
        rgblabel.font = UIFont(name: "Futura", size: 48)
        rgblabel.numberOfLines = 1
        rgblabel.minimumScaleFactor = 0.5
        rgblabel.shadowOffset = CGSize(width: -3, height: 2)
        rgblabel.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        rgblabel.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        rgblabel.text = rgblabel.textColor.toRGB()
        
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
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        saveButton.setTitle("Save", for: UIControl.State.normal)
        saveButton.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: UIControl.State.normal)
        saveButton.backgroundColor = UIColor.clear
        saveButton.layer.borderWidth = 1.0
        saveButton.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        saveButton.layer.cornerRadius = cornerRadius
        
        return saveButton
    }()
}
