//
//  MainView.swift
//  Pwned
//
//  Created by Vlad Munteanu on 3/5/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SnapKit

public class AttackView: UIView {
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
        addSubview(networkLabel)
        addSubview(activityIndicator)
        addSubview(attackButton)
        
        
    }
    
    func createConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview()
            
        }
        networkLabel.snp.makeConstraints{ make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        activityIndicator.snp.makeConstraints{ make in
            make.centerY.centerX.equalToSuperview()
        }
        attackButton.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview().multipliedBy(0.45)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.9)
        }
    }
    
    //Main Background
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return backgroundView
    }()
    
   
    
    //Label
    public let networkLabel: UILabel = {
        let netLbl = UILabel()
        netLbl.font = UIFont(name: "Futura", size: 30)
        netLbl.numberOfLines = 1
        netLbl.minimumScaleFactor = 0.5
        netLbl.translatesAutoresizingMaskIntoConstraints = false
        netLbl.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        netLbl.text = "No Wifi Selected..."
        return netLbl
    }()
    
   
    
    //MARK: Probably going to use an alert for this
    //Button
    public let activityIndicator: UIActivityIndicatorView = {
        let actIndi = UIActivityIndicatorView()
        actIndi.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return actIndi
    }()
    
    //Button
    public let attackButton: UIButton = {
        let attackBttn = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        attackBttn.setTitle("Start Attack", for: UIControl.State.normal)
        attackBttn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        attackBttn.backgroundColor = UIColor.clear
        attackBttn.layer.borderWidth = 1.0
        attackBttn.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        attackBttn.layer.cornerRadius = cornerRadius
        
        return attackBttn
    }()
    
   
    
}
