//
//  GameOverScene.swift
//  DonaghysDungeon6.0
//
//  Created by  on 1/23/18.
//  Copyright © 2018 AssistStat. All rights reserved.
//

import UIKit
import GameplayKit

class GameOverScene: SKScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameStartScene = GameStartScene(fileNamed: "GameStartScene")
        gameStartScene?.scaleMode = .aspectFit
        let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
        view?.presentScene(gameStartScene!, transition: reveal)
    }

    

}
