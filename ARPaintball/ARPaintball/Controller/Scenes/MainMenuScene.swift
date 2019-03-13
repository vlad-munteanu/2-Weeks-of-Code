//
//  MainMenuScene.swift
//  ARPaintball
//
//  Created by Vlad Munteanu on 3/13/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import SpriteKit

class MainMenuScene : SKScene {
    
    var myDelegate: MainMenuDelegate?
    
    let ARView = SKLabelNode()
 
    
    override func didMove(to view: SKView) {
        
        
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        createTri()
        
        //ARView
        ARView.fontSize = 50
        ARView.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        ARView.position = CGPoint(x: 190, y: 200)
        ARView.text = "AR Mode"
        ARView.fontName = "Futura"
        ARView.name = "ARPlay"
        //ARView.zPosition = 1
        
        // add the label to the scene
        addChild(ARView)
        
    }
    
    func createTri() {
        let length: CGFloat = 200
        var points = [CGPoint(x:length, y:-length / 2.0),
                      CGPoint(x:-length, y:-length / 2.0),
                      CGPoint(x: 0.0, y: length),
                      CGPoint(x:length, y:-length / 2.0)]
        let Triangle = SKShapeNode(points: &points, count: points.count)
        Triangle.fillColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        Triangle.position = CGPoint(x: 190, y: 500)
        self.addChild(Triangle)
    }
    
    //TODO: Fix transitions to new scenes
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "ARPlay" {
                myDelegate?.moveToAR()
            }
            
        }
        
    }
}
