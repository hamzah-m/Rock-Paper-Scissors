//
//  Sign.swift
//  Rock Paper Scissors
//
//  Created by Hamzah Mugharbil on 8/17/17.
//  Copyright © 2017 Hamzah Mugharbil. All rights reserved.
//

import Foundation
//import GameplayKit
//
//let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
//
//func randomSign() -> Sign {
//    let computerSign = randomChoice.nextInt()
//    if sign == 0 {
//        return .Rock
//    }
//}


var computerSign: Sign = .rock

func generateComputerSign() {
    let random: Int = Int(arc4random_uniform(3))
    
    switch random {
    case 0:
        computerSign = .paper
    case 1:
        computerSign = .rock
    case 2:
        computerSign = .scissors
    default:
        break
    }
    
    
}


enum Sign {
    case rock , paper, scissors
    
    static func gameState(playerSign: Sign) -> GameState {
        generateComputerSign()
        if computerSign == playerSign {
            return .draw
        } else if computerSign == .scissors && playerSign == .rock {
            return .win
        } else if computerSign == .rock && playerSign == .paper {
            return .win
        } else if computerSign == .paper && playerSign == .scissors {
            return .win
        } else {
            return .lose
        }
    }
}





