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

    var BAC = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    func setUpTable() {
        
        form +++ Section("Gender")
            <<< SegmentedRow<String>() {
                $0.tag = "Gender"
                $0.options = ["Male", "Female"] }
            +++ Section("Drinks")
            <<< PhoneRow(){ row in
                //beers
                row.tag = "Beers"
                row.title = "Beers (12 fl oz)"
                row.placeholder = ""
            }
            <<< PhoneRow(){
                $0.tag = "Wine"
                $0.title = "Glasses of Wine (5 fl oz)"
                $0.placeholder = ""
            }
            <<< PhoneRow(){
                $0.tag = "Liquour"
                $0.title = "Shots of Hard Liquor (1.5 fl oz)"
                $0.placeholder = ""
            }
            +++ Section("Other Variables")
            <<< PhoneRow(){
                $0.tag = "Hours"
                $0.title = "Over How Many Hours"
            }
            <<< PhoneRow(){
                $0.tag = "Weight"
                $0.title = "Your Weight (lbs)"
                $0.placeholder = ""
        }
            +++ Section()
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "Calculate"
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.doWork()
        }
        
    }
    
    func doWork() {
        let genderrow: SegmentedRow<String>? = form.rowBy(tag: "Gender")
        let gender = genderrow!.value
         print("gender \(gender)")
        
        let beerrow: PhoneRow? = form.rowBy(tag: "Beers")
        let beer = beerrow!.value
         print("beer \(beer)")
        
        let winerow: PhoneRow? = form.rowBy(tag: "Wine")
        let wine = winerow!.value
         print("wine \(wine)")

        let liqourrow: PhoneRow? = form.rowBy(tag: "Liquour")
        let liqour = liqourrow!.value
         print("liqour \(liqour)")

        let hoursrow: PhoneRow? = form.rowBy(tag: "Hours")
        let hours = hoursrow!.value
        print("hours \(hours)")

        let weightrow: PhoneRow? = form.rowBy(tag: "Weight")
        let weight = weightrow!.value
        print("weight \(weight)")
        
        
        
    }
    func showAlert() {
        let alertController = UIAlertController(title: "OnCellSelection", message: "Button Row Action", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true)
        
    }


}

