//
//  GameViewController.swift
//  DengsterV2.1
//
//  Created by Vlad Munteanu on 3/7/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var currentGame: GameScene!
    
     let currentSK = MainView()
    
    public override func loadView() {
        self.view = currentSK
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Load the SKScene from 'GameScene.sks'
        if let scene = SKScene(fileNamed: "GameScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            currentSK.backgroundView.presentScene(scene)
            currentGame = scene as? GameScene
            currentGame.viewController = self
            
            
            currentSK.backgroundView.ignoresSiblingOrder = true
            
            currentSK.backgroundView.showsFPS = true
            currentSK.backgroundView.showsNodeCount = true
        }
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
