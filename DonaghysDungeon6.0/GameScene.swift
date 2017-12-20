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
       intro()
        }
    
    func intro(){
        wait(time: 1.0)
        makeLabel(text: "Donaghy's", size: 75, x: Double(frame.width / 2), y: Double(frame.height / 1.6))
        wait(time: 1.0)
        makeLabel(text: "Dungeon", size: 75, x: Double(frame.width / 2), y: Double(frame.height / 1.8))
        wait(time: 1.0)
        makeLabel(text: "Tap anywhere to begin", size: 50, x: Double(frame.width / 2), y: Double(frame.height / 2.2))
    }
    
    
    
    func wait(time: Double){
        var wait = SKAction.wait(forDuration: time)
        run(wait)
    }
        
    
    
    func makeLabel(text: String, size: Int, x: Double, y: Double){
        let label = SKLabelNode(fontNamed: "Luminari")
        label.text = text
        label.fontSize = CGFloat(size)
        label.position = CGPoint(x: x , y: y)
        label.fontColor = UIColor.yellow
        addChild(label)
    }
    
    
    
}
