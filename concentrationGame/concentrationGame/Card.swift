//
//  Card.swift
//  concentrationGame
//
//  Created by Kristofer Sartorial on 4/2/25.
//

import Foundation

struct Card
{
    var isFaceIsUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getIniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getIniqueIdentifier()
    }
}
