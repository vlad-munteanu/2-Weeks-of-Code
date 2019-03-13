//
//  NormalView.swift
//  GraphTheory
//
//  Created by Vlad Munteanu on 3/13/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//


import UIKit
import SpriteKit
import SnapKit

class NormalView: UIView {
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
        addSubview(mainView)
        addSubview(ColorButton)
        addSubview(HomeButton)
        addSubview(ResetButton)
    }
    
    internal func createConstraints(){
        mainView.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        HomeButton.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.05)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview().multipliedBy(0.2)
            
        }
        ColorButton.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview().multipliedBy(1.8)
        }
        ResetButton.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.right.equalToSuperview().inset(20)
            make.centerY.equalToSuperview().multipliedBy(1.8)
        }
    }
    
    public let mainView = SKView()
    
    
    //Buttons
    public let HomeButton: UIButton = {
        let randButton = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        randButton.setTitle("Home", for: UIControl.State.normal)
        randButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        randButton.backgroundColor = UIColor.clear
        randButton.layer.borderWidth = 1.0
        randButton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        randButton.layer.cornerRadius = cornerRadius
        
        return randButton
    }()
    
    public let ColorButton: UIButton = {
        let randButton = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        randButton.setTitle("Color", for: UIControl.State.normal)
        randButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        randButton.backgroundColor = UIColor.clear
        randButton.layer.borderWidth = 1.0
        randButton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        randButton.layer.cornerRadius = cornerRadius
        
        return randButton
    }()
    
    public let ResetButton: UIButton = {
        let randButton = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        randButton.setTitle("Reset", for: UIControl.State.normal)
        randButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        randButton.backgroundColor = UIColor.clear
        randButton.layer.borderWidth = 1.0
        randButton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        randButton.layer.cornerRadius = cornerRadius
        
        return randButton
    }()
    
    
}
