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
        addSubview(startButton)
        addSubview(pauseButton)
        addSubview(currentModeLabel)
    }
    
    internal func createConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.width.height.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
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
    public let startButton: UIButton = {
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
    
    public let pauseButton: UIButton = {
        let pauseBttn = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        pauseBttn.setTitle("Pause", for: UIControl.State.normal)
        pauseBttn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        pauseBttn.backgroundColor = UIColor.clear
        pauseBttn.layer.borderWidth = 1.0
        pauseBttn.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        pauseBttn.layer.cornerRadius = cornerRadius
        return pauseBttn
    }()
    
    //Label
    //TODO: Check if I want to use this font or not
    public let currentModeLabel: UILabel = {
        let currentModeLbl = UILabel()
        currentModeLbl.font = UIFont(name: "Futura", size: 48)
        currentModeLbl.numberOfLines = 1
        currentModeLbl.minimumScaleFactor = 0.5
        currentModeLbl.shadowOffset = CGSize(width: -3, height: 2)
        currentModeLbl.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        currentModeLbl.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        currentModeLbl.text = "Study Mode"
        
        currentModeLbl.adjustsFontSizeToFitWidth = true
        currentModeLbl.textAlignment = .center
        currentModeLbl.translatesAutoresizingMaskIntoConstraints = false
        
        return currentModeLbl
    }()
    
    
    
}
