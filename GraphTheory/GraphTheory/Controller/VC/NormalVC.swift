//
//  NormalVC.swift
//  GraphTheory
//
//  Created by Vlad Munteanu on 3/13/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//


import UIKit
import SpriteKit
import GameplayKit

class NormalVC: UIViewController {
    
    
    //current View
    let currentView = NormalView()
    
    //buttons
    unowned var homeBttn: UIButton {return currentView.HomeButton}
    unowned var colorBttn: UIButton {return currentView.ColorButton}
    unowned var resetBttn: UIButton {return currentView.ResetButton}
   
    public override func loadView() {
        self.view = currentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Show statistics such as fps and node count
        currentView.mainView.showsFPS = true
        currentView.mainView.showsNodeCount = true
        
        let scene = NormalScene(size: currentView.bounds.size)
        scene.scaleMode = .resizeFill
        currentView.mainView.presentScene(scene)
        
        homeBttn.addTarget(self, action: #selector(goHome), for: UIControl.Event.touchUpInside)
        colorBttn.addTarget(self, action: #selector(addColor), for: UIControl.Event.touchUpInside)
        resetBttn.addTarget(self, action: #selector(resetScene), for: UIControl.Event.touchUpInside)
    }
    
    @objc func goHome() {
        let vc = MainMenuVC()
        self.present(vc, animated: true, completion: nil)
    }
    @objc func addColor() {
        //TODO: Add Color Code
    }
    @objc func resetScene() {
        //TODO: Reset Code
    }
    
    
  
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
