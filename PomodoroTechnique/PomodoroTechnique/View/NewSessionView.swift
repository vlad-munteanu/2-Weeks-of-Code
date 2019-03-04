//
//  NewSessionView.swift
//  PomodoroTechnique
//
//  Created by Vlad Munteanu on 3/4/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SnapKit

public class NewSessionView: UIView {
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
        addSubview(newSessionButton)
        
    }
    
    internal func createConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.width.height.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
        newSessionButton.snp.makeConstraints{ make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
            make.width.equalTo(newSessionButton.snp_height)
            
        }
    }
    
    //Making everything black and white
    
    //Main Background Subview
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return backgroundView
    }()
    
    //Main Button
    public let newSessionButton: UIButton = {
        let newBttn = UIButton()
        
        //newBttn.setTitle("Start", for: UIControl.State.normal)
        newBttn.setImage(#imageLiteral(resourceName: "addButton"), for: UIControl.State.normal)
        newBttn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        newBttn.backgroundColor = UIColor.clear

        return newBttn
    }()
}
