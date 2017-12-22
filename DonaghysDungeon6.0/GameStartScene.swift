//
//  GameStartScene.swift
//  DonaghysDungeon6.0
//
//  Created by  on 12/20/17.
//  Copyright © 2017 AssistStat. All rights reserved.
//

import UIKit
import GameplayKit



class GameStartScene: SKScene {
        var player = SKSpriteNode()
    
    
    
    
    
    override func sceneDidLoad() {
        //setting border of world
        let borderBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.friction = 0.0
        physicsBody = borderBody
        //getting access
        player = childNode(withName: "player") as! SKSpriteNode
        
    }
    



}
