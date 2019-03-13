//
//  GameViewController.swift
//  GraphTheory
//
//  Created by Vlad Munteanu on 3/13/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class GameViewController: UIViewController, ARSKViewDelegate {

    //Current View
    let currentView = ARView()
    
    
    public override func loadView() {
        self.view = currentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        currentView.mainScene.delegate = self
        
        // Show statistics such as fps and node count
        currentView.mainScene.showsFPS = true
        currentView.mainScene.showsNodeCount = true
        
        let scene = GameScene(size: currentView.bounds.size)
        scene.scaleMode = .resizeFill
        currentView.mainScene.presentScene(scene)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        //configuration.planeDetection = .horizontal
        
        // Run the view's session
        currentView.mainScene.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        currentView.mainScene.session.pause()
    }
    
    
    // MARK: - ARSKViewDelegate
    
//    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
//        //let ghostId = randomInt(min: 1, max: 6)
//        
//        //let node = SKSpriteNode(imageNamed: "ghost\(ghostId)")
//        node.name = "ghost"
//        
//        return node
//    }
//    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
