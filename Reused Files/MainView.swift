//
//  MainView.swift
//  SSHButton
//
//  Created by Vlad Munteanu on 3/10/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import UIKit
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
        addSubview(commandLabel)
        addSubview(setCommandButton)
    }
    
    internal func createConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        commandLabel.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.2)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
        }
        setCommandButton.snp.makeConstraints{ make in
            make.centerY.equalToSuperview().multipliedBy(0.2)
            make.right.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.13)
            make.height.equalTo(setCommandButton.snp_width)
        }
     
    }
    

    //Main Background Subview
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        return backgroundView
    }()
    
    //Label
    public let commandLabel: UILabel =  {
        let commandLbl = UILabel()
        commandLbl.font = UIFont(name: "Futura", size: 50)
        commandLbl.numberOfLines = 1
        commandLbl.minimumScaleFactor = 0.5
        commandLbl.shadowOffset = CGSize(width: -3, height: 2)
        commandLbl.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        commandLbl.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        commandLbl.text = "No Command Set"
        
        commandLbl.adjustsFontSizeToFitWidth = true
        commandLbl.textAlignment = .center
        commandLbl.translatesAutoresizingMaskIntoConstraints = false
        return commandLbl
    }()
    
    //Side Button
    public let setCommandButton: UIButton = {
        let cancelBttn = UIButton()
        
        
        cancelBttn.setImage(#imageLiteral(resourceName: "WriteButton"), for: UIControl.State.normal)
        cancelBttn.backgroundColor = UIColor.clear
        
        return cancelBttn
    }()
    
}
