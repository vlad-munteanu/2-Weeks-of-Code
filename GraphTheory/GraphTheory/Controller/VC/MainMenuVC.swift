//
//  MainMenuVC.swift
//  GraphTheory
//
//  Created by Vlad Munteanu on 3/13/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class MainMenuVC: UIViewController, MainMenuDelegate {
    
    
    //current View
    let currentView = MainMenuView()
  
    public override func loadView() {
        self.view = currentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Show statistics such as fps and node count
        currentView.mainView.showsFPS = true
        currentView.mainView.showsNodeCount = true
        
        let scene = MainMenuScene(size: currentView.bounds.size)
        scene.myDelegate = self
        scene.scaleMode = .resizeFill
        currentView.mainView.presentScene(scene)
    }
    
    func moveToNormalScene() {
        let vc = NormalVC()
        self.present(vc, animated: true, completion: nil)
    }
    
    func moveToAR() {
        let vc =  ARVC()
        self.present(vc, animated: true, completion: nil)
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
