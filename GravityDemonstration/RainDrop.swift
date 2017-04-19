//
//  RainDrop.swift
//  GravityDemonstration
//
//  Created by William Brancato on 3/1/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class RainDrop: SKNode {
    
    init(image: SKSpriteNode) {
        super.init()
        
        // determine which side of the x axis the rain drop will spawn
        let randomNumber = arc4random_uniform(2)
        let x: CGFloat = randomNumber == 0 ? 1 : -1
        
        // set the starting position of the node
        self.position = CGPoint(x: (CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width))) * x),
                                y: UIScreen.main.bounds.height)
        
        // set the size of the node
        self.setScale(0.01)
        
        // apply a physics body to the node
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "raindrop"),
                                         size: CGSize(width: image.size.width * 0.01,
                                                      height: image.size.height * 0.01))
        
        // set the bit mask properties
        self.physicsBody?.categoryBitMask = RainDropCategory
        self.physicsBody?.contactTestBitMask = FloorCategory
        self.physicsBody?.collisionBitMask
            = PersonCategory
        
        self.physicsBody?.linearDamping = 5 // adjust how fast an object falls
        self.physicsBody?.restitution = 2 // adjust how bouncy an object is
        
        // add the image to the object
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







