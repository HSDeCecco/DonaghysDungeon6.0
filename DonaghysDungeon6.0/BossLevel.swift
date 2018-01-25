//
//  BossLevel.swift
//  DonaghysDungeon6.0
//
//  Created by Harry De Cecco on 1/24/18.
//  Copyright © 2018 AssistStat. All rights reserved.
//

import UIKit
import GameplayKit
struct PhysicsCategory3 {
    static let player: UInt32 = 0
    static let boss: UInt32 = 1
}
class BossLevel: SKScene, SKPhysicsContactDelegate {

    var player = SKSpriteNode()
    var boss = SKSpriteNode()
    var hit = 0
    
    override func didMove(to view: SKView) {
        
        player = childNode(withName: "player") as! SKSpriteNode
        boss = childNode(withName: "boss") as! SKSpriteNode
        
        player.physicsBody?.categoryBitMask = PhysicsCategory3.player
        boss.physicsBody?.categoryBitMask = PhysicsCategory3.boss
        
        physicsWorld.contactDelegate = self
        
        player.physicsBody?.contactTestBitMask = PhysicsCategory3.boss
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation =  touch!.location(in: self)
        player.position = CGPoint(x: touchLocation.x , y: touchLocation.y )
    
        if touchLocation == touch!.location(in: boss){
            hit += 1
            if hit == 5{
                let endOfGame = EndOfGame(fileNamed: "EndOfGame")
                endOfGame?.scaleMode = .aspectFit
                let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(endOfGame!, transition: reveal)
            }
        }
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
