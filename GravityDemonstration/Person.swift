//
//  Person.swift
//  GravityDemonstration
//
//  Created by William Brancato on 3/1/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class Person: SKNode {
    
    init(image: SKSpriteNode) {
        super.init()
        
        // set the size and starting position
        self.position = CGPoint(x: 0, y: 0)
        self.xScale = 0.25
        self.yScale = 0.25
        
        // apply a physics body to the node
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Person"),
                                         size: CGSize(width: image.size.width * 0.25,
                                                      height: image.size.height * 0.25))
        
        // set the bit mask properties
        self.physicsBody?.categoryBitMask = PersonCategory
        self.physicsBody?.contactTestBitMask = FloorCategory
        self.physicsBody?.collisionBitMask = FloorCategory
        
        // add the image the object
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // enables the ability to drag the person along the x axis
    func move(touchLocation: CGPoint) {
        if self.calculateAccumulatedFrame().contains(touchLocation) {
            self.position.x = touchLocation.x
        }
    }
}


