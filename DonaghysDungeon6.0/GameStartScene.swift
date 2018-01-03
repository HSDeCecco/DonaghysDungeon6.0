//
//  GameStartScene.swift
//  DonaghysDungeon6.0
//
//  Created by  on 12/22/17.
//  Copyright © 2017 AssistStat. All rights reserved.
//

import UIKit
import GameplayKit

class GameStartScene: SKScene {
    
    var player = SKSpriteNode()
    var fingerOnPlayer = false
    
    override func sceneDidLoad() {
        //getting access
        player = childNode(withName: "player") as! SKSpriteNode
        
        
        
    }
    
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
    
    
    
}
