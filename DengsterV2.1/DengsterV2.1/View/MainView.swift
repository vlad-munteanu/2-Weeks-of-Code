//
//  MainView.swift
//  DengsterV2.1
//
//  Created by Vlad Munteanu on 3/7/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import SnapKit

public class MainView: SKView {
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
        
        backgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    
    internal func createConstraints(){
    }
    
    //Main Background Subview
    public let backgroundView: SKView = {
        let backgroundView = SKView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return backgroundView
    }()
    
    
}
