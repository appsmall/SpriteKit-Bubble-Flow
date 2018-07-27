//
//  AnimationScene.swift
//  SpriteKit (BubblesFlow)
//
//  Created by Shashank Panwar on 26/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import SpriteKit


class AnimationScene: SKScene {
    
    var animationBackground: SKSpriteNode!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        animationBackground = SKSpriteNode(color: UIColor.blue, size: size)
        animationBackground.anchorPoint = CGPoint(x: 0, y: 1.0)
        animationBackground.position = CGPoint(x: 0, y: 0)
        self.addChild(animationBackground)
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        addBubble()
        floatBubbles()
        removeExcessBubbles()
    }
    
    func addBubble() {
        let bubble = SKSpriteNode(color: UIColor.white, size: CGSize(width: 10, height: 10))
        animationBackground.addChild(bubble)
        let startingPoint = CGPoint(x: size.width/2, y: (-1)*size.height)
        bubble.position = startingPoint
    }
    
    func floatBubbles() {
        for child in animationBackground.children {
            let xOffset: CGFloat = CGFloat(arc4random_uniform(20)) - 10.0
            let yOffset: CGFloat = 20.0
            let newLocation = CGPoint(x: child.position.x + xOffset, y: child.position.y + yOffset)
            let moveAction = SKAction.move(to: newLocation, duration: 0.2)
            child.run(moveAction)
        }
    }
    
    func removeExcessBubbles() {
        for child in animationBackground.children {
            if child.position.y > 0 {
                child.removeFromParent()
            }
        }
    }
}
