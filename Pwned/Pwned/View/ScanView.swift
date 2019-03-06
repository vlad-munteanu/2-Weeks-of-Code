//
//  ScanView.swift
//  Pwned
//
//  Created by Vlad Munteanu on 3/5/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SnapKit

public class ScanView: UIView {
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
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview()
            
        }
    }
    
    //Main Background
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return backgroundView
    }()
}
