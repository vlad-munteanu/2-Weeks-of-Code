//
//  GameScene.swift
//  DengsterV2.1
//
//  Created by Vlad Munteanu on 3/7/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var spinnyNode : SKSpriteNode?
    
    weak var viewController: GameViewController!
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.08
        self.spinnyNode = SKSpriteNode.init(texture: SKTexture(image: UIImage(named: "boolChris.png")!), size: CGSize(width: w, height: w))
        
        if let spinnyNode = self.spinnyNode {
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: spinDuration)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 5.0),
                                              SKAction.fadeOut(withDuration: fadeOutTime),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKSpriteNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKSpriteNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKSpriteNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
