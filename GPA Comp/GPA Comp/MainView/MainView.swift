//
//  MainView.swift
//  GPA Comp
//
//  Created by Vlad Munteanu on 3/11/19.
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
        addSubview(mainLabel)
    }
    
    internal func createConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        mainLabel.snp.makeConstraints{ make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.15)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
            
        }
        
    }
    
    //Main Background Subview
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        return backgroundView
    }()
    
    
    public let mainLabel: UILabel = {
        let mainLbl = UILabel()
        mainLbl.font = UIFont(name: "Futura", size: 48)
        mainLbl.numberOfLines = 1
        mainLbl.minimumScaleFactor = 0.5
        mainLbl.shadowOffset = CGSize(width: -3, height: 2)
        mainLbl.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        mainLbl.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        mainLbl.text = "View Apple Watch to Use"
        
        mainLbl.adjustsFontSizeToFitWidth = true
        mainLbl.textAlignment = .center
        mainLbl.translatesAutoresizingMaskIntoConstraints = false
        
        return mainLbl
    }()
}
