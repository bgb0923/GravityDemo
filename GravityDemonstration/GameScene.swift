//
//  GameScene.swift
//  GravityDemonstration
//
//  Created by William Brancato on 3/1/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//


import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // create an instance of the person and the floor
    let person = Person(image: SKSpriteNode(imageNamed: "Person"))
    let floor = Floor()
    
    // add the instances to the GameScene
    override func didMove(to view: SKView) {
        self.addChild(person)
        self.addChild(floor)
    }
    
    override func sceneDidLoad() {
        // set the game scene as the physics protocol delegate
        self.physicsWorld.contactDelegate = self
    }
    
    // handle what happens when a user touches the person on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.person.move(touchLocation: (touches.first?.location(in: self))!)
    }
    
    // handle what happens when the user drags the person across a screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.person.move(touchLocation: (touches.first?.location(in: self))!)
    }
    
    
    // anything placed here will happen at every update interval
    override func update(_ currentTime: TimeInterval) {
        spawnRain()
        spawnRain()
        spawnRain()
    }
    
    // spawn random rain drops
    func spawnRain() {
        let rainDrop = RainDrop(image:SKSpriteNode(imageNamed: "raindrop"))
        self.addChild(rainDrop)
    }
    
    // handle contact events
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == RainDropCategory) && (contact.bodyB.categoryBitMask == FloorCategory) {
            contact.bodyA.node?.removeFromParent()
        } else if (contact.bodyA.categoryBitMask == FloorCategory) && (contact.bodyB.categoryBitMask == RainDropCategory)  {
            contact.bodyB.node?.removeFromParent()
        }
    }


}



