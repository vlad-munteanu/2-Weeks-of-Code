//
//  MainView.swift
//  Speed Limit Checker
//
//  Created by Vlad Munteanu on 3/2/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import SnapKit
import MapKit

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
        addSubview(mapView)
       // addSubview(titleLabel)
        addSubview(speedLabelSubview)
        addSubview(speedLabel)
    }
    
    internal func createConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        mapView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
//        titleLabel.snp.makeConstraints { make in
//            make.height.equalToSuperview().multipliedBy(0.1)
//            make.left.equalToSuperview().multipliedBy(0.2)
//            make.bottom.equalTo(backgroundSubView.snp_top).multipliedBy(1.1)
//        }
        
        speedLabelSubview.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.13)
            
        }
        speedLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.85)
            
        }
        
        
    }
    
    //Main Background Subview
    public let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = colors[0]
        return backgroundView
    }()
    
//    //BackgroundSubview
//    public let backgroundSubView: UIView = {
//        let backsubview = UIView()
//        backsubview.layer.cornerRadius = 10
//        backsubview.layer.masksToBounds = true
//        backsubview.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 0.5236025528)
//        return backsubview
//        //TODO: Add curved corners
//    }()
    
    //MapView
    public let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.layer.cornerRadius = 10
        mapView.layer.masksToBounds = true
        return mapView
    }()
    
    //Title Label
    public let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Futura", size: 32)
        titleLabel.text = "speed limit"
        titleLabel.numberOfLines = 1
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    //Speed Label Subview
    public let speedLabelSubview: UIView = {
        let speedLabelSubview = UIView()
        speedLabelSubview.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 0.900528169)
        return speedLabelSubview
    }()
    
    //Speed Label
    public let speedLabel: UILabel = {
        let speedlabel = UILabel()
        speedlabel.font = UIFont(name: "Futura", size: 60)
        speedlabel.text = "25 MPH"
        speedlabel.numberOfLines = 1
        speedlabel.minimumScaleFactor = 0.5
        speedlabel.shadowOffset = CGSize(width: -3, height: 2)
        speedlabel.textColor = colors[0] 
        speedlabel.shadowColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        
        speedlabel.adjustsFontSizeToFitWidth = true
        speedlabel.textAlignment = .center
        speedlabel.translatesAutoresizingMaskIntoConstraints = false
        return speedlabel
    }()
    
    //Location Label
    public let locationLabel: UILabel = {
        let location = UILabel()
        location.font = UIFont(name: "Futura", size: 20)
        location.text = "Current Location: "
        location.numberOfLines = 1
        location.minimumScaleFactor = 0.5
        location.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        location.adjustsFontSizeToFitWidth = true
        location.textAlignment = .left
        location.translatesAutoresizingMaskIntoConstraints = false
        return location
        
    }()
    
    
}
