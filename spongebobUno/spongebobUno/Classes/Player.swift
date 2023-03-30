//
//  Player.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 3/2/23.
//

import Foundation
import SwiftUI

// Player Class
class Player: ObservableObject {
    
    @Published var playerCards: [Card]
    
    init() {
        self.playerCards = []
    }
    
    // add a card to array
    func addCard(card: Card) {
        playerCards.append(card)
    }
    
    // remove and return a card specified by UUID
    func playCard(id: UUID) -> Card {
        
        return playerCards.remove(at: playerCards.firstIndex(where: {$0.id == id})!)
    }
    
    // get playerCards size
    func getPlayerCardsSize() -> Int {
        return playerCards.endIndex
    }
    
    // checks if player can play a card
    func canPlayCard(playedCards: [Card]) -> Bool {
        for card in playerCards {
            if (card.value == playedCards.last?.value || card.type == playedCards.last?.type || card.value > 12) {
                return true
            }
        }
        return false
    }
    
    // reset cards
    func resetCards() {
        playerCards.removeAll()
    }
    
    func printCards() {
        for card in playerCards {
            print(card)
        }
    }
    
}
