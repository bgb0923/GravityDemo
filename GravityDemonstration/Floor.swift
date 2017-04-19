//
//  Floor.swift
//  GravityDemonstration
//
//  Created by William Brancato on 3/1/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class Floor : SKNode {
    
    override init() {
        super.init()
        
        // set the size and position of the node
        self.position = CGPoint(x:0, y: -UIScreen.main.bounds.height / 2)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: UIScreen.main.bounds.width * 2,
                                                             height: 20))
        
        // set the bit mask properties
        self.physicsBody?.categoryBitMask = FloorCategory
        self.physicsBody?.contactTestBitMask = RainDropCategory
        self.physicsBody?.collisionBitMask = PersonCategory
        
        // apply a physics body to the node
        self.physicsBody?.isDynamic = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







