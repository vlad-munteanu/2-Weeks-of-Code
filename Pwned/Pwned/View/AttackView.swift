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
        
        
    }
    
    func createConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview()
            
        }
        networkLabel.snp.makeConstraints{ make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview().multipliedBy(0.3)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        activityIndicator.snp.makeConstraints{ make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    
    //Main Background
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
        netLbl.text = "Not Connected Yet..."
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
    public let activityIndicator: UIActivityIndicatorView = {
        let actIndi = UIActivityIndicatorView()
        actIndi.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return actIndi
    }()
    
   
    
}
