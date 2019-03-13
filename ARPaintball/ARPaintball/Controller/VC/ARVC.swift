//
//  ARVC.swift
//  ARPaintball
//
//  Created by Vlad Munteanu on 3/13/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

var touchePos = [ARAnchor]()
var pointsJaunt = [SKNode]()

import UIKit
import SpriteKit
import ARKit

class ARVC: UIViewController, ARSKViewDelegate {
    
    //Current View
    let currentView = ARView()
    
    //button
    unowned var homeBttn: UIButton {return currentView.HomeButton}
    unowned var colorBttn: UIButton {return currentView.ColorButton}
    
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
        
        let scene = ARScene(size: currentView.bounds.size)
        scene.scaleMode = .resizeFill
        currentView.mainScene.presentScene(scene)
        
        homeBttn.addTarget(self, action: #selector(goHome), for: UIControl.Event.touchUpInside)
        colorBttn.addTarget(self, action: #selector(addColor), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func goHome() {
        let vc = MainMenuVC()
        self.present(vc, animated: true, completion: nil)
    }
    @objc func addColor() {
        //TODO: Add Color Code
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        currentView.mainScene.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        currentView.mainScene.session.pause()
    }
    
    
    
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's session.
        
        let spriteNode = createShape()
        spriteNode.fillColor = UIColor.blue
        
        
        
        
        //execute both actions simultaneously
        
        pointsJaunt.append(spriteNode)
        
        return spriteNode;
    }
    
    func createShape() -> SKShapeNode {
        
        
        let point = SKShapeNode(circleOfRadius: 10.0)
        point.fillColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return point
        
        
    }
    
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


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        
        return UIColor(red: .random(),
                       green: .random(),
                       blue: .random(),
                       alpha: 1.0)
    }
    
}
