//
//  GameScene.swift
//  GraphTheory
//
//  Created by Vlad Munteanu on 3/13/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import SpriteKit
import ARKit


class ARScene: SKScene {
    
    let triangleLabel = SKLabelNode(text: "Triangles")
    let numberOfTrianglesLabel = SKLabelNode(text: "0")
    var creationTime : TimeInterval = 0
    
    var triangleCount = 0 {
        didSet{
            self.numberOfTrianglesLabel.text = "\(triangleCount)"
        }
    }
    
    let killSound = SKAction.playSoundFileNamed("ghost", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        triangleLabel.fontSize = 20
        triangleLabel.fontName = "Futura"
        triangleLabel.color = .white
        triangleLabel.position = CGPoint(x: 40, y: 50)
        addChild(triangleLabel)
        
        numberOfTrianglesLabel.fontSize = 30
        numberOfTrianglesLabel.fontName = "Futura"
        numberOfTrianglesLabel.color = .white
        numberOfTrianglesLabel.position = CGPoint(x: 40, y: 10)
        addChild(numberOfTrianglesLabel)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get first touch
        guard let touch = touches.first else {
            return
        }
        // Get location in the scene
        let location = touch.location(in: self)
        
        //touchePos.append(location)
        // Get the nodes at the clicked location
        let clicked = nodes(at: location)
        
        // Get the first node
        if let node = clicked.first {

        } else {
            guard let sceneView = self.view as? ARSKView else {
                return
            }
            
            // Create anchor using the camera's current position
            if let currentFrame = sceneView.session.currentFrame {
                
                // Create a transform with a translation of 0.4 meters in front of the camera
                var translation = matrix_identity_float4x4
                translation.columns.3.z = -3.0
                let transform = simd_mul(currentFrame.camera.transform, translation)
                
                // Add a new anchor to the session
                let anchor = ARAnchor(transform: transform)
                touchePos.append(anchor)
                sceneView.session.add(anchor: anchor)
            }
        }
    }
}
