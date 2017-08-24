//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Hamzah Mugharbil on 8/17/17.
//  Copyright © 2017 Hamzah Mugharbil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var globalState: GameState = .start
    var playerSign: Sign = .paper
    var selectedSignText = ""
    var computerSignText = ""
    
    
   
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var stackLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rockButton(_ sender: UIButton) {
        if globalState == .start {
            selectedSignText = "👊"
            changeState(Sign.gameState(playerSign: .rock))
        }
        
    }
    @IBAction func scissorsButton(_ sender: UIButton) {
        if globalState == .start {
            selectedSignText = "✌️"
            changeState(Sign.gameState(playerSign: .scissors))
        }
    }
    @IBAction func paperButton(_ sender: UIButton) {
        if globalState == .start {
            selectedSignText = "✋️"
            changeState(Sign.gameState(playerSign: .paper))
        }
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        if globalState != .start {
            globalState = .start
            changeState(.start)
        }
    }
    
    func changeState(_ gameState: GameState) {
        
        
        
        if gameState == .start {
            
            self.view.backgroundColor = UIColor.gray
            leftButton.setTitle("👊", for: .normal)
            middleButton.setTitle("✋️", for: .normal)
            rightButton.setTitle("✌️", for: .normal)
            computerLabel.text = "🤖"
            playAgain.setTitle("", for: .normal)
            stackLabel.text = "Rock, Paper, Scissors?"
            return
            
        }

        leftButton.setTitle("", for: .normal)
        middleButton.setTitle(selectedSignText, for: .normal)
        rightButton.setTitle("", for: .normal)
        playAgain.setTitle("Play again?", for: .normal)

        
        switch computerSign {
        case .scissors:
            computerLabel.text = "✌️"
        case .paper:
            computerLabel.text = "✋️"
        case .rock:
            computerLabel.text = "👊"
        }
        
        if gameState == .win {
            self.view.backgroundColor = UIColor.green
            stackLabel.text = "You won! :)"
        } else if gameState == .lose {
            self.view.backgroundColor = UIColor.red
            stackLabel.text = "You lost :("
        } else {
            stackLabel.text = "It's a draw :|"
        }
        globalState = gameState
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

