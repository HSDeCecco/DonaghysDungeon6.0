//
//  GameScene.swift
//  DonaghysDungeon6.0
//
//  Created by Christopher Walter on 12/19/17.
//  Copyright © 2017 AssistStat. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    
    override func sceneDidLoad() {
        firstLabel()
        secondLabel()
        }
        
        
    
    func firstLabel(){
        let label = SKLabelNode(fontNamed: " ")
        label.text = "Donaghy's"
        label.fontSize = CGFloat(75)
        label.position = CGPoint(x: frame.width / 2 , y: frame.height / 2)
        label.fontColor = UIColor.yellow
        addChild(label)
        
    }
    func secondLabel(){
        let label = SKLabelNode(fontNamed: "")
        label.text = "Dungeon"
        label.fontSize = CGFloat(75)
        label.position = CGPoint(x: frame.width / 2 , y: frame.height / 2.2)
        label.fontColor = UIColor.yellow
        addChild(label)
        
    }
    
    
    
    
}
