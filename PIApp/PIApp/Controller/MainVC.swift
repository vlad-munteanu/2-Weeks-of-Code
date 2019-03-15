//
//  ViewController.swift
//  PIApp
//
//  Created by Vlad Munteanu on 3/14/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import CDAlertView

class MainVC: UIViewController, UITextFieldDelegate {

    
    
    let piConstant = "3.14159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196442881097566593344612847564823378678316527120190914564856692346034861045432664821339360726024914127372458700660631558817488152092096282925409171536436789259036001133053054882046652138414695194151160943305727036575959195309218611738193261179310511854807446237996274956735188575272489122793818301194912983367336244065664308602139496395224737190702179860943702770539217176293176752384674818467669405132000568127145263560827785771342757789609173637178721468440901224953430146549585371050792279689258923542019956112129021960864034418159813629774771309960518707211349999998372978049951059731732816096318595024459455346908302642522308253344685035261931188171010003137838752886587533208381420617177669147303598253490428755468731159562863882353787593751957781857780532171226806613001927876611195909216420198938095257201065485863278865936153381827968230301952035301852968995773622599413891249721775283479131515574857242454150695950829533116861727855889075098381754637464939319255060400927701671139009848824012858361603563707660104710181942955596198946767837449448255379774726847104047534646208046684259069491293313677028989152104752162056966024058038150193511253382430035587640247496473263914199272604269922796782354781636009341721641219924586315030286182974555706749838505494588586926995690927210797509302955321165344987202755960236480665499119881834797753566369807426542527862551818417574672890977772793800081647060016145249192173217214772350141441973568548161361157352552133475741849468438523323907394143334547762416862518983569485562099219222184272550254256887671790494601653466804988627"
    //main view
    let mainView = MainView()
    //random button
   // unowned var randomButton: UIButton {return colorView.randomButton}
    
    //Textfields
    unowned var textfield: UITextField { return mainView.textTF}
    
    public override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        print(Float.pi)
        // Do any additional setup after loading the view.
    }

    //dismisses keyboard when user touches screen elsewhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        runChecks()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        runChecks()
        return false
    }
    
    func runChecks() {
        var numOfDigits = -1
        let text = textfield.text!
        textfield.text = ""
        
        for i in 0..<text.count {
            print(i)
            if text[i] == piConstant[i] {
                numOfDigits += 1
            } else {
                break
            }
        }
        
        let highscore = isNewHighScore(num: numOfDigits)
        
        runAlert(newScore: highscore, num: numOfDigits)
    }
    
    func isNewHighScore(num: Int) -> Bool{
        
        if UserDefaults.standard.integer(forKey: "highscore") == nil {
            UserDefaults.standard.set(0, forKey: "highscore")
        }
        if num > UserDefaults.standard.integer(forKey: "highscore") {
            UserDefaults.standard.set(num, forKey: "highscore")
            return true
        }
        return false
    }
    
    func runAlert(newScore: Bool, num: Int) {
        if newScore == true {
            let alert = CDAlertView(title: "New High Score!", message: "You got \(num) digits of Pi!",type: .alarm)
            mainView.highscoreLbl.text = "High Score: \(UserDefaults.standard.integer(forKey: "highscore"))"
            alert.alertBackgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            alert.isTextFieldHidden = true
            let okAction = CDAlertViewAction(title: "Ok 👍🏼")
            okAction.buttonTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            alert.add(action: okAction)
            alert.show() { (alert) in
                print("completed")
                
            }
        } else {
            let alert = CDAlertView(title: "", message: "You got \(num) digits of Pi!",type: .alarm)
            alert.alertBackgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            alert.isTextFieldHidden = true
            let okAction = CDAlertViewAction(title: "Ok 👍🏼")
            okAction.buttonTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            alert.add(action: okAction)
            alert.show() { (alert) in
                print("completed")
                
            }
        }
        
    }
}

extension StringProtocol {
    
    subscript(offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
    
    subscript(_ range: CountableRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    subscript(range: CountableClosedRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        return prefix(range.upperBound.advanced(by: 1))
    }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        return prefix(range.upperBound)
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        return suffix(Swift.max(0, count - range.lowerBound))
    }
}


extension LosslessStringConvertible {
    var string: String { return String(self) }
}

extension BidirectionalCollection {
    subscript(safe offset: Int) -> Element? {
        guard !isEmpty, let i = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[i]
    }
}
