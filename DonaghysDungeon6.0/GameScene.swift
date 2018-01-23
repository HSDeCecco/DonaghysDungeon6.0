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
    
    var label = 0
    
    
    override func sceneDidLoad() {
            intro()

        }
    
    
    
    
    
    func intro(){
        makeLabel(text: "Donaghy's", size: 75, x: Double(frame.width / 2), y: Double(frame.height / 1.6))
        makeLabel(text: "Dungeon", size: 75, x: Double(frame.width / 2), y: Double(frame.height / 2.2))
        makeLabel(text: "Tap anywhere to begin", size: 50, x: Double(frame.width / 2), y: Double(frame.height / 3.2))
    }
    
    
    
    
        
    
    
    func makeLabel(text: String, size: Int, x: Double, y: Double){
        let label = SKLabelNode(fontNamed: "Papyrus")
        label.text = text
        label.fontSize = CGFloat(size)
        label.position = CGPoint(x: x , y: y)
        label.fontColor = UIColor.yellow
        addChild(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeAllChildren()
        label += 1
        if label == 1{
            makeLabel(text: "Deep in the depths", size: 40, x: Double(frame.width / 2), y: Double(frame.height / 1.8))
            makeLabel(text: "of Haverford High School", size: 40, x: Double(frame.width / 2), y: Double(frame.height / 2.2))
        }
        if label == 2{
            makeLabel(text: "Lurks an unspeakable", size: 40, x: Double(frame.width / 2), y: Double(frame.height / 1.8))
            makeLabel(text: "evil", size: 40, x: Double(frame.width / 2), y: Double(frame.height / 2.2))
        }
        if label == 3{
            makeLabel(text: "That can only be stopped by", size: 30, x: Double(frame.width / 2), y: Double(frame.height / 1.8))
            makeLabel(text: "You!", size: 40, x: Double(frame.width / 2), y: Double(frame.height / 2.2))
        }
        if label == 4{
            
            let gameStartScene = GameStartScene(fileNamed: "GameStartScene")

            gameStartScene?.scaleMode = .aspectFit
            let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
            view?.presentScene(gameStartScene!, transition: reveal)
//            let gamestartscene = GameStartScene(size: self.size)
//            let reveal = SKTransition.moveIn(with: SKTransitionDirection.down, duration: 1)
//            view?.presentScene(gamestartscene, transition: reveal)
//            print("reveal")
        }
        
        
        
        
    }
    
    
}

