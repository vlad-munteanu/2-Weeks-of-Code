//
//  InputView.swift
//  TextToSpeech
//
//  Created by Vlad Munteanu on 3/6/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SnapKit
import JVFloatLabeledTextField

public class InputView: UIView {
    
    
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
        addSubview(textTF)
        addSubview(speakButton)
    }
    
    internal func createConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        textTF.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.6)
            make.width.equalToSuperview().multipliedBy(0.95)
        }
        speakButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textTF.snp_bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.1)
                
        }
    }
    
    //Main Background Subview
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return backgroundView
    }()
    
    //Textfields
    public let textTF: JVFloatLabeledTextField = {
        let tf = JVFloatLabeledTextField()
        tf.floatingLabel.text = "Text"
        tf.floatingLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tf.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return tf
    }()
    
    //button
    public let speakButton: UIButton = {
        let speakBttn = UIButton()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        speakBttn.setTitle("Convert to Speech", for: UIControl.State.normal)
        speakBttn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        speakBttn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        speakBttn.layer.borderWidth = 1.0
        speakBttn.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        speakBttn.layer.cornerRadius = cornerRadius
        
        return speakBttn
    }()
    
}
