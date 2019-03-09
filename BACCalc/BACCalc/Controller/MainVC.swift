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
        
        form +++ Section("Gender")
            <<< SegmentedRow<String>() { $0.options = ["Male", "Female"] }
            +++ Section("Drinks")
            <<< PhoneRow(){ row in
                //beers
                row.tag = "Beers"
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
            <<< PhoneRow(){
                $0.title = "Over How Many Hours"
            }
            <<< PhoneRow(){
                $0.title = "Your Weight (lbs)"
                $0.placeholder = ""
        }
            +++ Section()
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "Calculate"
                }
                .onCellSelection { [weak self] (cell, row) in
                    self?.showAlert()
        }
        
    }
    
    func doWork() {
        let beerrow: TextRow? = form.rowBy(tag: "Beers")
        let beer = row!.value
        
        let beerrow: TextRow? = form.rowBy(tag: "Beers")
        let beer = row!.value
        
        
    }
    func showAlert() {
        let alertController = UIAlertController(title: "OnCellSelection", message: "Button Row Action", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true)
        
    }


}

