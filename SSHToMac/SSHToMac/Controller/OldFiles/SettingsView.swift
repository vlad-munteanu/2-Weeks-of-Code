//
//  SettingsView.swift
//  SSHToMac
//
//  Created by Vlad Munteanu on 3/3/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SnapKit

public class SettingsView: UIView {
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
       
    }
    
    func createConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    //Views
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return backgroundView
    }()
}
