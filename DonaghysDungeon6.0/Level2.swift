//
//  Level2.swift
//  DonaghysDungeon6.0
//
//  Created by  on 1/23/18.
//  Copyright © 2018 AssistStat. All rights reserved.
//

import UIKit
import GameplayKit
struct PhysicsCategory2 {
    static let player: UInt32 = 0
    static let spikes: UInt32 = 1
    static let skeleton1: UInt32 = 2
    static let skeleton2: UInt32 = 3
    static let skeleton3: UInt32 = 4
    static let skeleton4: UInt32 = 5
    static let skeleton5: UInt32 = 6
    static let spider1: UInt32 = 7
    static let spider2: UInt32 = 8
    static let spider3: UInt32 = 9
    static let spider4: UInt32 = 10
    static let spider5: UInt32 = 11
    static let zombie1: UInt32 = 12
    static let zombie2: UInt32 = 13
    static let zombie3: UInt32 = 14
    static let zombie4: UInt32 = 15
    static let zombie5: UInt32 = 16
    static let goal: UInt32 = 17

}

class Level2: SKScene, SKPhysicsContactDelegate{
    
    var player = SKSpriteNode()
    var spikes = SKSpriteNode()
    var skeleton1 = SKSpriteNode()
    var skeleton2 = SKSpriteNode()
    var skeleton3 = SKSpriteNode()
    var skeleton4 = SKSpriteNode()
    var skeleton5 = SKSpriteNode()
    var spider1 = SKSpriteNode()
    var spider2 = SKSpriteNode()
    var spider3 = SKSpriteNode()
    var spider4 = SKSpriteNode()
    var spider5 = SKSpriteNode()
    var zombie1 = SKSpriteNode()
    var zombie2 = SKSpriteNode()
    var zombie3 = SKSpriteNode()
    var zombie4 = SKSpriteNode()
    var zombie5 = SKSpriteNode()
    var goal = SKSpriteNode()

    override func didMove(to view: SKView) {
        //getting access
        player = childNode(withName: "player") as! SKSpriteNode
        spikes = childNode(withName: "spikes") as! SKSpriteNode
        skeleton1 = childNode(withName: "skeleton1") as! SKSpriteNode
        skeleton2 = childNode(withName: "skeleton2") as! SKSpriteNode
        skeleton3 = childNode(withName: "skeleton3") as! SKSpriteNode
        skeleton4 = childNode(withName: "skeleton4") as! SKSpriteNode
        skeleton5 = childNode(withName: "skeleton5") as! SKSpriteNode
        spider1 = childNode(withName: "spider1") as! SKSpriteNode
        spider2 = childNode(withName: "spider2") as! SKSpriteNode
        spider3 = childNode(withName: "spider3") as! SKSpriteNode
        spider4 = childNode(withName: "spider4") as! SKSpriteNode
        spider5 = childNode(withName: "spider5") as! SKSpriteNode
        zombie1 = childNode(withName: "zombie1") as! SKSpriteNode
        zombie2 = childNode(withName: "zombie2") as! SKSpriteNode
        zombie3 = childNode(withName: "zombie3") as! SKSpriteNode
        zombie4 = childNode(withName: "zombie4") as! SKSpriteNode
        zombie5 = childNode(withName: "zombie5") as! SKSpriteNode
        goal = childNode(withName: "goal") as! SKSpriteNode

        //collistion
        player.physicsBody?.categoryBitMask = PhysicsCategory2.player
        spikes.physicsBody?.categoryBitMask = PhysicsCategory2.spikes
        skeleton1.physicsBody?.categoryBitMask = PhysicsCategory2.skeleton1
        skeleton2.physicsBody?.categoryBitMask = PhysicsCategory2.skeleton2
        skeleton3.physicsBody?.categoryBitMask = PhysicsCategory2.skeleton3
        skeleton4.physicsBody?.categoryBitMask = PhysicsCategory2.skeleton4
        skeleton5.physicsBody?.categoryBitMask = PhysicsCategory2.skeleton5
        spider1.physicsBody?.categoryBitMask = PhysicsCategory2.spider1
        spider2.physicsBody?.categoryBitMask = PhysicsCategory2.spider2
        spider3.physicsBody?.categoryBitMask = PhysicsCategory2.spider3
        spider4.physicsBody?.categoryBitMask = PhysicsCategory2.spider4
        spider5.physicsBody?.categoryBitMask = PhysicsCategory2.spider5
        zombie1.physicsBody?.categoryBitMask = PhysicsCategory2.zombie1
        zombie2.physicsBody?.categoryBitMask = PhysicsCategory2.zombie2
        zombie3.physicsBody?.categoryBitMask = PhysicsCategory2.zombie3
        zombie4.physicsBody?.categoryBitMask = PhysicsCategory2.zombie4
        zombie5.physicsBody?.categoryBitMask = PhysicsCategory2.zombie5
        goal.physicsBody?.categoryBitMask = PhysicsCategory2.goal
        physicsWorld.contactDelegate = self

        player.physicsBody?.contactTestBitMask = PhysicsCategory2.spikes | PhysicsCategory2.skeleton1 | PhysicsCategory2.skeleton2 | PhysicsCategory2.skeleton3 | PhysicsCategory2.skeleton4 | PhysicsCategory2.skeleton5 | PhysicsCategory2.spider1 | PhysicsCategory2.spider2 | PhysicsCategory2.spider3 | PhysicsCategory2.spider4 | PhysicsCategory2.spider5 | PhysicsCategory2.zombie1 | PhysicsCategory2.zombie2 | PhysicsCategory2.zombie3 | PhysicsCategory2.zombie4 | PhysicsCategory2.zombie5 | PhysicsCategory2.goal
    
    
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        //all deaths
        //spikes
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.spikes) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.spikes){
            if contact.bodyA.node == spikes || contact.bodyB.node == spikes {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        //skeletons
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.skeleton1) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.skeleton1){
            if contact.bodyA.node == skeleton1 || contact.bodyB.node == skeleton1 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.skeleton2) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.skeleton2){
            if contact.bodyA.node == skeleton2 || contact.bodyB.node == skeleton2 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.skeleton3) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.skeleton3){
            if contact.bodyA.node == skeleton3 || contact.bodyB.node == skeleton3 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.skeleton4) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.skeleton4){
            if contact.bodyA.node == skeleton4 || contact.bodyB.node == skeleton4 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.skeleton5) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.skeleton5){
            if contact.bodyA.node == skeleton5 || contact.bodyB.node == skeleton5 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        //spiders
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.spider1) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.spider1){
            if contact.bodyA.node == spider1 || contact.bodyB.node == spider1 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.spider2) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.spider2){
            if contact.bodyA.node == spider2 || contact.bodyB.node == spider2 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.spider3) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.spider3){
            if contact.bodyA.node == spider3 || contact.bodyB.node == spider3 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.spider4) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.spider4){
            if contact.bodyA.node == spider4 || contact.bodyB.node == spider4 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.spider5) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.spider5){
            if contact.bodyA.node == spider5 || contact.bodyB.node == spider5 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        //zombies
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.zombie1) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.zombie1){
            if contact.bodyA.node == zombie1 || contact.bodyB.node == zombie1 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.zombie2) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.zombie2){
            if contact.bodyA.node == zombie2 || contact.bodyB.node == zombie2 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.zombie3) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.zombie3){
            if contact.bodyA.node == zombie3 || contact.bodyB.node == zombie3 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.zombie4) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.zombie4){
            if contact.bodyA.node == zombie4 || contact.bodyB.node == zombie4 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.zombie5) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.zombie5){
            if contact.bodyA.node == zombie5 || contact.bodyB.node == zombie5 {
                //go to game over scene
                let gameOverScene = GameOverScene(fileNamed: "GameOverScene")
                gameOverScene?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(gameOverScene!, transition: reveal)
            }
        }
        if (contact.bodyA.categoryBitMask == PhysicsCategory2.player && contact.bodyB.categoryBitMask == PhysicsCategory2.goal) || (contact.bodyB.categoryBitMask == PhysicsCategory2.player && contact.bodyA.categoryBitMask == PhysicsCategory2.goal){
            if contact.bodyA.node == goal || contact.bodyB.node == goal {
                //go to next level
                let bossLevel = BossLevel(fileNamed: "BossLevel")
                bossLevel?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(bossLevel!, transition: reveal)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //moving
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation =  touch!.location(in: self)
        player.position = CGPoint(x: touchLocation.x , y: touchLocation.y )
        
        if touchLocation == touch!.location(in: skeleton1){
            skeleton1.removeFromParent()
        }
        if touchLocation == touch!.location(in: skeleton2){
            skeleton2.removeFromParent()
        }
        if touchLocation == touch!.location(in: skeleton3){
            skeleton3.removeFromParent()
        }
        if touchLocation == touch!.location(in: skeleton4){
            skeleton4.removeFromParent()
        }
        if touchLocation == touch!.location(in: skeleton5){
            skeleton5.removeFromParent()
        }
        if touchLocation == touch!.location(in: spider1){
            spider1.removeFromParent()
        }
        if touchLocation == touch!.location(in: spider2){
            spider2.removeFromParent()
        }
        if touchLocation == touch!.location(in: spider3){
            spider3.removeFromParent()
        }
        if touchLocation == touch!.location(in: spider4){
            spider4.removeFromParent()
        }
        if touchLocation == touch!.location(in: spider5){
            spider5.removeFromParent()
        }
        if touchLocation == touch!.location(in: zombie1){
            zombie1.removeFromParent()
        }
        if touchLocation == touch!.location(in: zombie2){
            zombie2.removeFromParent()
        }
        if touchLocation == touch!.location(in: zombie3){
            zombie3.removeFromParent()
        }
        if touchLocation == touch!.location(in: zombie4){
            zombie4.removeFromParent()
        }
        if touchLocation == touch!.location(in: zombie5){
            zombie5.removeFromParent()
        }

        
        
        
        
    }
    
    
    
    
}
