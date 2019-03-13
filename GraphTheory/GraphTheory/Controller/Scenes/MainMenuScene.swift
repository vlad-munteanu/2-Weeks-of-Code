//
//  MainMenuScene.swift
//  GraphTheory
//
//  Created by Vlad Munteanu on 3/13/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//


import SpriteKit

class MainMenuScene : SKScene {
    
    let ARView = SKLabelNode()
    let normalView = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        //normalView
        normalView.fontSize = 42
        normalView.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        normalView.position = CGPoint(x: size.width / 2, y: size.height * 0.75)
        normalView.text = "Normal Mode"
        normalView.name = "NormalPlay"
        normalView.zPosition = 1
        
        
        //ARView
        ARView.fontSize = 42
        ARView.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ARView.position = CGPoint(x: size.width / 2, y: size.height * 0.52)
        ARView.text = "AR Mode"
        ARView.fontName = "Futura"
        ARView.name = "ARPlay"
        ARView.zPosition = 1
        
        // add the label to the scene
        addChild(normalView)
        addChild(ARView)
        
    }
    
    //TODO: Fix transitions to new scenes
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "NormalPlay" {
                let scene = NormalScene(size: size)
                self.view?.presentScene(scene)
            } else if name == "ARPlay" {
                let scene = ARScene(size: size)
                self.view?.presentScene(scene)
            }
            
        }
        
    }
}
