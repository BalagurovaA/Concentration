//
//  ViewController.swift
//  concentrationGame
//
//  Created by Kristofer Sartorial on 4/2/25.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet { flipCountLabel.text = "Flips: \(flipCount)" }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func newRoundOfGame(_ sender: UIButton) {
        flipCount = 0
        emojiChoices = ["👻", "🎃", "🎭", "🦑", "🦇", "🌚", "🧛🏻‍♀️"]
        emoji = [:]
        game = Concentration(numberPairsOfCards: (cardButtons.count + 1) / 2)

    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.choseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("chosen car was not in cardButtons")
        }
        
    }
    
    
    
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceIsUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.black : UIColor.red
            }
            
        }
    }
    
    var emojiChoices = ["👻", "🎃", "🎭", "🦑", "🦇", "🌚", "🧛🏻‍♀️"]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String? {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        
        return emoji[card.identifier] ?? "?"
    }
}



