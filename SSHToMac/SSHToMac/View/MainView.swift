//
//  MainView.swift
//  SSHToMac
//
//  Created by Vlad Munteanu on 3/3/19.
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func intializeUI() {
        addSubview(backgroundView)
        addSubview(terminalView)
        addSubview(cmdTextfield)
        addSubview(sendCommandButton)
        terminalView.addSubview(commandLabel)
    }
    
    func createConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        terminalView.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.6)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
        }
        commandLabel.snp.makeConstraints{ make in
            make.width.equalTo(terminalView.snp_width).multipliedBy(0.9)
        }
        cmdTextfield.snp.makeConstraints{ make in
            make.top.equalTo(terminalView.snp_bottom)
        }
        sendCommandButton.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.45)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.45)
            
        }
        
        
    }
    
    //Views
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return backgroundView
    }()
    
    public let terminalView: UIScrollView = {
        let termView = UIScrollView()
        termView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        termView.translatesAutoresizingMaskIntoConstraints = false
        return termView
    }()
    
    //\n for new line
    
    //Labels
    public let commandLabel: UILabel = {
        let cmdLabel = UILabel()
        cmdLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        cmdLabel.font = UIFont(name: "System", size: 14)
        cmdLabel.numberOfLines = 0
        cmdLabel.minimumScaleFactor = 0.5
        cmdLabel.translatesAutoresizingMaskIntoConstraints = false
        cmdLabel.textColor = #colorLiteral(red: 0.07459209753, green: 1, blue: 0.07377539981, alpha: 1)
        cmdLabel.text = "internal func createConstraints( backgroundView.snp.makeConstraints { make in 38             make.height.equalToSuperview() 39             make.width.equalToSuperview() 40         } hexLabel.snp.makeConstraints{ make in           make.height.equalToSuperview().multipliedBy(0.07) make.width.equalToSuperview().multipliedBy(0.7) make.centerX.equalToSuperview() make.centerY.equalToSuperview().multipliedBy(0.75)"
        return cmdLabel
    }()
    
    //Textfield
    public let cmdTextfield: UITextField = {
        let cmdTF = UITextField()
        cmdTF.translatesAutoresizingMaskIntoConstraints = false
        return cmdTF
    }()
    
    //Button
    public let sendCommandButton: UIButton = {
        let cmdButton = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        cmdButton.setTitle("Randomize", for: UIControl.State.normal)
        cmdButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControl.State.normal)
        cmdButton.backgroundColor = UIColor.clear
        cmdButton.layer.borderWidth = 1.0
        cmdButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cmdButton.layer.cornerRadius = cornerRadius
        cmdButton.translatesAutoresizingMaskIntoConstraints = false
        
        return cmdButton
    }()
    
}
