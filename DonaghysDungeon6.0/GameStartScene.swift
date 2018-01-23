//
//  GameStartScene.swift
//  DonaghysDungeon6.0
//
//  Created by  on 12/22/17.
//  Copyright © 2017 AssistStat. All rights reserved.
//

import UIKit
import GameplayKit
struct PhysicsCategory {
    static let player: UInt32 = 0
    static let key: UInt32 = 1
    static let chest: UInt32 = 2
    static let spikes: UInt32 = 3
    static let goal: UInt32 = 4
    static let skeleton: UInt32 = 5
}
class GameStartScene: SKScene, SKPhysicsContactDelegate {
    
    var player = SKSpriteNode()
    var key = SKSpriteNode()
    var chest = SKSpriteNode()
    var spikes = SKSpriteNode()
    var goal = SKSpriteNode()
    var skeleton = SKSpriteNode()
    var fingerOnPlayer = false
    var doYouHaveKey = false
    var doYouHaveSword = false
    
    override func sceneDidLoad() {
        
    }
    
    override func didMove(to view: SKView) {
        //getting access
        player = childNode(withName: "player") as! SKSpriteNode
        key = childNode(withName: "key") as! SKSpriteNode
        chest = childNode(withName: "chest") as! SKSpriteNode
        spikes = childNode(withName: "spikes") as! SKSpriteNode
        goal = childNode(withName: "goal") as! SKSpriteNode
        skeleton = childNode(withName: "skeleton") as! SKSpriteNode
        //collision prepare
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        key.physicsBody?.categoryBitMask = PhysicsCategory.key
        chest.physicsBody?.categoryBitMask = PhysicsCategory.chest
        spikes.physicsBody?.categoryBitMask = PhysicsCategory.spikes
        goal.physicsBody?.categoryBitMask = PhysicsCategory.goal
        skeleton.physicsBody?.categoryBitMask = PhysicsCategory.skeleton
        physicsWorld.contactDelegate = self
        
        player.physicsBody?.contactTestBitMask = PhysicsCategory.key | PhysicsCategory.chest | PhysicsCategory.spikes | PhysicsCategory.goal | PhysicsCategory.skeleton
    }
    
    
    
    //contact
    
    func didBegin(_ contact: SKPhysicsContact) {
        //key contact
        if (contact.bodyA.categoryBitMask == PhysicsCategory.player && contact.bodyB.categoryBitMask == PhysicsCategory.key) || (contact.bodyB.categoryBitMask == PhysicsCategory.player && contact.bodyA.categoryBitMask == PhysicsCategory.key){
            if contact.bodyA.node == key || contact.bodyB.node == key {
                key.removeFromParent()
                doYouHaveKey = true
                print("you have the key")
                }
            
        }
        //chest contact
        if doYouHaveKey == true{
            if (contact.bodyA.categoryBitMask == PhysicsCategory.player && contact.bodyB.categoryBitMask == PhysicsCategory.chest) || (contact.bodyB.categoryBitMask == PhysicsCategory.player && contact.bodyA.categoryBitMask == PhysicsCategory.chest){
                if contact.bodyA.node == chest || contact.bodyB.node == chest {
                    chest.texture = SKTexture(imageNamed: "opened chest")
                    player.texture = SKTexture(imageNamed: "player with sword")
                    doYouHaveSword = true
                }
            }
        }
        //skeleton contact
        if doYouHaveSword == true{
            if (contact.bodyA.categoryBitMask == PhysicsCategory.player && contact.bodyB.categoryBitMask == PhysicsCategory.skeleton) || (contact.bodyB.categoryBitMask == PhysicsCategory.player && contact.bodyA.categoryBitMask == PhysicsCategory.skeleton){
                if contact.bodyA.node == skeleton || contact.bodyB.node == skeleton {
                    skeleton.zRotation = CGFloat(-90)
                }
            }
                
    
        }else{
            if (contact.bodyA.categoryBitMask == PhysicsCategory.player && contact.bodyB.categoryBitMask == PhysicsCategory.skeleton) || (contact.bodyB.categoryBitMask == PhysicsCategory.player && contact.bodyA.categoryBitMask == PhysicsCategory.skeleton){
                if contact.bodyA.node == skeleton || contact.bodyB.node == skeleton {
                    //go to game over scene
                    let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                    gameOverScene?.scaleMode = .aspectFit
                    let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                    view?.presentScene(gameOverScene!, transition: reveal)
                }
            }
        }
        //spikes
        if (contact.bodyA.categoryBitMask == PhysicsCategory.player && contact.bodyB.categoryBitMask == PhysicsCategory.spikes) || (contact.bodyB.categoryBitMask == PhysicsCategory.player && contact.bodyA.categoryBitMask == PhysicsCategory.spikes){
            if contact.bodyA.node == spikes || contact.bodyB.node == spikes {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        
        //goal
        if (contact.bodyA.categoryBitMask == PhysicsCategory.player && contact.bodyB.categoryBitMask == PhysicsCategory.goal) || (contact.bodyB.categoryBitMask == PhysicsCategory.player && contact.bodyA.categoryBitMask == PhysicsCategory.goal){
            if contact.bodyA.node == goal || contact.bodyB.node == goal {
                //go to next level
                let level2 = Level2(fileNamed: "Level2")
                level2?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(level2!, transition: reveal)
                
                
                
            }
        }

        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //moving
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation =  touch!.location(in: self)
        if let body = physicsWorld.body(at: touchLocation) {
            if body.node?.name == "player" {
                fingerOnPlayer = true
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if fingerOnPlayer == true{
            let touch = touches.first
            let touchLocation =  touch!.location(in: self)
            player.position = CGPoint(x: touchLocation.x , y: touchLocation.y )
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        fingerOnPlayer = false
    }
    
    
    
    
    
    
    
    
    
}
        
    

