//
//  BACCalculator.swift
//  BACCalc
//
//  Created by Vlad Munteanu on 3/8/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation

public class BACCalculator {
    
    //use double in order to ensure
    class func calculate(beers: Int, wine: Int, shots: Int, hours: Int, weight: Int, gender: String) -> Double {
        var BAC: Double = 0
        let rFem = 0.55
        let rMale = 0.68
        
        let gramsOfAlc = ((Double(beers) * 0.05) + (Double(wine) * 0.12) + (Double(shots) * 0.4))*14
        
        var temp = 0.0
        if gender == "Male" {
            temp = (gramsOfAlc / (Double(weight) * rMale)) * 100
            
        } else {
            temp = (gramsOfAlc / (Double(weight) * rFem)) * 100
        }
        
        BAC = (temp - (Double(hours) * 0.015)) / 100
        
        return BAC
    }
}
