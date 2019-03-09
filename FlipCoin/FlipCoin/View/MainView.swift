//
//  MainView.swift
//  FlipCoin
//
//  Created by Vlad Munteanu on 3/9/19.
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
        addSubview(flipButton)
        addSubview(headsTailLabel)
    }
    
    func createConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        flipButton.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.4)
            make.width.equalTo(flipButton.snp_height)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        headsTailLabel.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.4)
            
        }
    }
    
    //Main Background Subview
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        return backgroundView
    }()
    
    //Button
    public let flipButton: UIButton = {
        let flipBttn = UIButton()
        flipBttn.setImage(UIImage(named: "coin0"), for: .normal)
        
        return flipBttn
    }()
    
    //Label
    public let headsTailLabel: UILabel = {
        let headsTailLbl = UILabel()
        headsTailLbl.font = UIFont(name: "Futura", size: 48)
        headsTailLbl.numberOfLines = 1
        headsTailLbl.minimumScaleFactor = 0.5
        headsTailLbl.shadowOffset = CGSize(width: -3, height: 2)
        headsTailLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headsTailLbl.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        headsTailLbl.text = "Tap to flip"
        
        headsTailLbl.adjustsFontSizeToFitWidth = true
        headsTailLbl.textAlignment = .center
        headsTailLbl.translatesAutoresizingMaskIntoConstraints = false
        return headsTailLbl
        
    }()
    
    
}
