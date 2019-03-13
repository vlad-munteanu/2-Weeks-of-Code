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
    

    
    public override func loadView() {
        self.view = currentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Show statistics such as fps and node count
        currentView.mainView.showsFPS = true
        currentView.mainView.showsNodeCount = true
        
        let scene = MainMenuScene(size: currentView.bounds.size)
        scene.scaleMode = .resizeFill
        currentView.mainView.presentScene(scene)
    }
    
    func presentButtons() {
        
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
