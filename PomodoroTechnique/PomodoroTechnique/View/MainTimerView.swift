//
//  MainTimerView.swift
//  PomodoroTechnique
//
//  Created by Vlad Munteanu on 3/4/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SnapKit

public class MainTimerView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect.zero
        
        intializeUI()
        createConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func intializeUI() {
        addSubview(backgroundView)
        addSubview(startPauseButton)
        addSubview(currentModeLabel)
        addSubview(tasknameLabel)
        addSubview(timerLabel)
    }
    
    internal func createConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.width.height.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
        tasknameLabel.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview().multipliedBy(0.2)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.06)
        }
        currentModeLabel.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.05)
            make.width.equalTo(tasknameLabel.snp_width)
            make.left.equalTo(tasknameLabel.snp_left)
            make.top.equalTo(tasknameLabel.snp.bottom)
        }
        timerLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
            
        }
    }
    
    //Making everything black and white
    
    //Main Background Subview
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return backgroundView
    }()
    
    //Buttons
    public let startPauseButton: UIButton = {
        let startBttn = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        startBttn.setTitle("Start", for: UIControl.State.normal)
        startBttn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        startBttn.backgroundColor = UIColor.clear
        startBttn.layer.borderWidth = 1.0
        startBttn.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        startBttn.layer.cornerRadius = cornerRadius
        return startBttn
    }()
    
    //Timer Label
    public let timerLabel: UILabel = {
        let timerLbl = UILabel()
        timerLbl.font = UIFont(name: "Futura", size: 90)
        timerLbl.numberOfLines = 1
        timerLbl.minimumScaleFactor = 0.8
        timerLbl.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        timerLbl.text = "21:00"
        
        timerLbl.adjustsFontSizeToFitWidth = true
        timerLbl.textAlignment = .center
        timerLbl.translatesAutoresizingMaskIntoConstraints = false
        
        return timerLbl
    }()
    
    
    //Label
    public let tasknameLabel: UILabel = {
        let tasknameLbl = UILabel()
        tasknameLbl.font = UIFont(name: "Futura", size: 38)
        tasknameLbl.numberOfLines = 1
        tasknameLbl.minimumScaleFactor = 0.3
        tasknameLbl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        tasknameLbl.text = "Study Mode"
        
        tasknameLbl.adjustsFontSizeToFitWidth = true
        tasknameLbl.textAlignment = .left
        tasknameLbl.translatesAutoresizingMaskIntoConstraints = false
        
        return tasknameLbl
    }()
    
    //TODO: Check if I want to use this font or not
    public let currentModeLabel: UILabel = {
        let currentModeLbl = UILabel()
        currentModeLbl.font = UIFont(name: "Futura", size: 28)
        currentModeLbl.numberOfLines = 1
        currentModeLbl.minimumScaleFactor = 0.3
        currentModeLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currentModeLbl.text = "Study Mode"
        
        currentModeLbl.adjustsFontSizeToFitWidth = true
        currentModeLbl.textAlignment = .left
        currentModeLbl.translatesAutoresizingMaskIntoConstraints = false
        
        return currentModeLbl
    }()
    
    
    
}
