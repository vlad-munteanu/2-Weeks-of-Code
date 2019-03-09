//
//  ViewController.swift
//  FlipCoin
//
//  Created by Vlad Munteanu on 3/9/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    var coinString = "Heads"
    //View
    let mainView = MainView()
    
    //Button
    unowned var flipButton: UIButton {return mainView.flipButton}
    
    //Label
    unowned var flipLabel: UILabel {return mainView.headsTailLabel}
    
    var imgListArray :NSMutableArray = []
    
    public override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.flipButton.addTarget(self, action: #selector(flipStuff), for: UIControl.Event.touchUpInside)
        setupImage()
    }
    
    func setupImage() {
        for i in 1...11 {
            var strImageName : String = "coin\(i)"
            var image = UIImage(named:strImageName)
            imgListArray.add(image)
        }
    }
    
    @objc func flipStuff() {
        let headsTails = Int(arc4random_uniform(2))
        
        flipImage(headsOrTails: headsTails)
        
        
    }
    
    func flipImage(headsOrTails: Int) {
        
        flipButton.imageView!.animationImages = imgListArray as! [UIImage]
        flipButton.imageView!.animationDuration = 2.0
        flipButton.imageView!.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {  self.flipButton.imageView!.stopAnimating()
        }
        
        if headsOrTails == 1 {
            coinString = "Heads"
            flipButton.setImage(UIImage(named: "coin10"), for: .normal)
            flipLabel.text = "Heads"
        } else {
            coinString = "Tails"
            flipButton.imageView!.stopAnimating()
            flipButton.setImage(UIImage(named: "coin5"), for: .normal)
            flipLabel.text = "Tails"
        }
        
        
    }


}

