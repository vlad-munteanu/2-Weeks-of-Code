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
        addSubview(spinSlider)
        addSubview(fadeOutSlider)
        addSubview(spinLabel)
        addSubview(fadeLabel)
    }
    
    
    internal func createConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        spinSlider.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.05)

        }
        spinLabel.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.05)
            make.bottom.equalTo(spinSlider.snp_top)
        }
        fadeLabel.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.05)
            make.top.equalTo(spinSlider.snp_bottom)
        }
        fadeOutSlider.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(fadeLabel.snp_bottom)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.05)
            
        }
    }
    
    //Main Background Subview
    public let backgroundView: SKView = {
        let backgroundView = SKView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return backgroundView
    }()
    
    //Sliders
    public let spinSlider: UISlider = {
        let sslider = UISlider()
        sslider.maximumValue = 10.0
        sslider.value = 1.0
        sslider.minimumValue = 0.1
        return sslider
    }()
    
    public let fadeOutSlider: UISlider = {
        let fadeOutSlide = UISlider()
        fadeOutSlide.maximumValue = 10.0
        fadeOutSlide.value = 5.0
        fadeOutSlide.minimumValue = 0.1
        return fadeOutSlide
    }()
    
    //Labels
    public let spinLabel: UILabel = {
        let spinLbl = UILabel()
        spinLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        spinLbl.font = UIFont(name: "Futura", size: 20)
        spinLbl.text = "Spin Duration: 1.0"
        spinLbl.numberOfLines = 1
        spinLbl.minimumScaleFactor = 0.5
        spinLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        spinLbl.adjustsFontSizeToFitWidth = true
        spinLbl.textAlignment = .left
        spinLbl.translatesAutoresizingMaskIntoConstraints = false
        return spinLbl
    }()
    
    public let fadeLabel: UILabel = {
        let fadeLbl = UILabel()
        fadeLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        fadeLbl.font = UIFont(name: "Futura", size: 20)
        fadeLbl.text = "Fade Out Duration: 5.0"
        fadeLbl.numberOfLines = 1
        fadeLbl.minimumScaleFactor = 0.5
        fadeLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        fadeLbl.adjustsFontSizeToFitWidth = true
        fadeLbl.textAlignment = .left
        fadeLbl.translatesAutoresizingMaskIntoConstraints = false
        return fadeLbl
    }() 
}
