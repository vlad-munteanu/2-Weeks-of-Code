//
//  MainView.swift
//  PIApp
//
//  Created by Vlad Munteanu on 3/14/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SnapKit

public class MainView: UIView {
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
        addSubview(piLabel)
        addSubview(highscoreLbl)
        addSubview(goBttn)
        addSubview(textTF)
        
    }
    
    internal func createConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        piLabel.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.15)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.4)
        }
        highscoreLbl.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview().multipliedBy(0.2)
        }
        goBttn.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.45)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.85)
        }
        textTF.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.05)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.7)
            
        }
    }
    
    //Main Background Subview
    public let backgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.image = UIImage(named: "bg")
        return backgroundView
    }()

    public let piLabel: UILabel = {
        let piLbl = UILabel()
        piLbl.font = UIFont(name: "Futura", size: 80)
        piLbl.numberOfLines = 1
        piLbl.minimumScaleFactor = 0.5
        piLbl.shadowOffset = CGSize(width: -3, height: 2)
        piLbl.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        piLbl.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        piLbl.text = "π"
        
        piLbl.adjustsFontSizeToFitWidth = true
        piLbl.textAlignment = .center
        piLbl.translatesAutoresizingMaskIntoConstraints = false
        return piLbl
    }()
    
    public let highscoreLbl: UILabel = {
        let highscoreLb = UILabel()
        highscoreLb.font = UIFont(name: "Futura", size: 20)
        highscoreLb.numberOfLines = 1
        highscoreLb.minimumScaleFactor = 0.5
        highscoreLb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        highscoreLb.text = "High Score: "
        
        highscoreLb.adjustsFontSizeToFitWidth = true
        highscoreLb.textAlignment = .left
        highscoreLb.translatesAutoresizingMaskIntoConstraints = false
        return highscoreLb
    }()
    
    //Textfields
    public let textTF: UITextField = {
        let tf = UITextField()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        tf.layer.cornerRadius = cornerRadius
        
        return tf
    }()
    
    
    //Button
    public let goBttn: UIButton = {
        let randButton = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        randButton.setTitle("Go", for: UIControl.State.normal)
        randButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        randButton.backgroundColor = UIColor.clear
        randButton.layer.borderWidth = 1.0
        randButton.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        randButton.layer.cornerRadius = cornerRadius
        
        return randButton
    }()
}
