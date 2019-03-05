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
        addSubview(networkView)
        networkView.addSubview(networksLabel)
        addSubview(networkTF)
        
    }
    
    func createConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview()
            
        }
    }
    
    //Main Background
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return backgroundView
    }()
    
    //Scroll View
    public let networkView: UIScrollView = {
        let netView = UIScrollView()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        netView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        netView.layer.borderWidth = 1.0
        netView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        netView.layer.cornerRadius = cornerRadius
        netView.translatesAutoresizingMaskIntoConstraints = false
        return netView
    }()
    
    //Label
    public let networksLabel: UILabel = {
        let netLbl = UILabel()
        netLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        netLbl.font = UIFont(name: "System", size: 12)
        netLbl.numberOfLines = 0
        netLbl.minimumScaleFactor = 0.5
        netLbl.translatesAutoresizingMaskIntoConstraints = false
        netLbl.textColor = #colorLiteral(red: 0.07459209753, green: 1, blue: 0.07377539981, alpha: 1)
        netLbl.text = "Not Connected Yet..."
        return netLbl
    }()
    
    //Textfield
    public let networkTF: UITextField = {
        let netTF = UITextField()
        netTF.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return netTF
    }()
    
    //MARK: Probably going to use an alert for this
    //Button
    public let sendWifiButton: UIButton = {
        let sendWifiBttn = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        sendWifiBttn.setTitle("Send", for: UIControl.State.normal)
        sendWifiBttn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControl.State.normal)
        sendWifiBttn.backgroundColor = UIColor.clear
        sendWifiBttn.layer.borderWidth = 1.0
        sendWifiBttn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sendWifiBttn.layer.cornerRadius = cornerRadius
        sendWifiBttn.translatesAutoresizingMaskIntoConstraints = false
        
        return sendWifiBttn
    }()
    
    public let wifiTableView: UITableView = {
        let wifiTV = UITableView()
        return wifiTV
    }()
}
