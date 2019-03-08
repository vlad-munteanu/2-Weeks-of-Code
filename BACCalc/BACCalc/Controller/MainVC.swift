//
//  ViewController.swift
//  BACCalc
//
//  Created by Vlad Munteanu on 3/8/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import Eureka

class MainVC: FormViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    func setUpTable() {
        form +++ Section("Drinks")
            <<< PhoneRow(){ row in
                //beers
                row.title = "Beers (12 fl oz)"
                row.placeholder = ""
            }
            <<< PhoneRow(){
                $0.title = "Glasses of Wine (5 fl oz)"
                $0.placeholder = ""
            }
            <<< PhoneRow(){
                $0.title = "Shots of Hard Liquor (1.5 fl oz)"
                $0.placeholder = ""
            }
            +++ Section("Other Variables")
            <<< DateRow(){
                $0.title = "Over How Many Hours"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }
            <<< TextRow(){
                $0.title = "Your Weight"
                $0.placeholder = "Enter text here"
        }
    }


}

