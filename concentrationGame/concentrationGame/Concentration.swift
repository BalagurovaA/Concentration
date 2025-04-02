//
//  Model.swift
//  concentrationGame
//
//  Created by Kristofer Sartorial on 4/2/25.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func choseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceIsUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceIsUp = false
                }
                cards[index].isFaceIsUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberPairsOfCards: Int) {
        for _ in 1...numberPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
    }

    
}
