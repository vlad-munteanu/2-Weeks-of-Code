//
//  MainMenuView.swift
//  GraphTheory
//
//  Created by Vlad Munteanu on 3/13/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import SpriteKit
import SnapKit

class MainMenuView: UIView {
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
        addSubview(mainView)
    }
    
    internal func createConstraints(){
        mainView.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
    }
    
    public let mainView = SKView()
    
}
