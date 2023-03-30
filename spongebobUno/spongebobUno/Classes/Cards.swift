//
//  Cards.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 2/22/23.
//

import Foundation
import SwiftUI

// Card Class
struct Card: Codable, Identifiable {
    var id: UUID 
    
    var type: String
    var value: Int
}

class CardClass: ObservableObject {
    @Published var deck: [Card]
    
    init() {
        self.deck = []
    }
    
    func createDeck() {
        
        // 0 - 9 = 0 - 9
        // 10 = draw two
        // 11 = reverse
        // 12 = skip
        // 13 = wild card
        // 14 = wild draw 4 card
        
        for i in 0..<15 {
            // create cards
            if (i == 0) {
                deck.append(Card(id: UUID(), type: "Spongebob", value: i))
                deck.append(Card(id: UUID(), type: "Squidward", value: i))
                deck.append(Card(id: UUID(), type: "Patrick", value: i))
                deck.append(Card(id: UUID(), type: "Gary", value: i))
            }
            // 1 - 9
            else if (i < 10) {
                for _ in 0..<2 {
                    deck.append(Card(id: UUID(), type: "Spongebob", value: i))
                    deck.append(Card(id: UUID(), type: "Squidward", value: i))
                    deck.append(Card(id: UUID(), type: "Patrick", value: i))
                    deck.append(Card(id: UUID(), type: "Gary", value: i))
                }
            }
            else if (i == 10) {
                deck.append(Card(id: UUID(), type: "Spongebob", value: i))
                deck.append(Card(id: UUID(), type: "Squidward", value: i))
                deck.append(Card(id: UUID(), type: "Patrick", value: i))
                deck.append(Card(id: UUID(), type: "Gary", value: i))
            }
            else if (i == 11) {
                deck.append(Card(id: UUID(), type: "Spongebob", value: i))
                deck.append(Card(id: UUID(), type: "Squidward", value: i))
                deck.append(Card(id: UUID(), type: "Patrick", value: i))
                deck.append(Card(id: UUID(), type: "Gary", value: i))
            }
            else if (i == 12) {
                deck.append(Card(id: UUID(), type: "Spongebob", value: i))
                deck.append(Card(id: UUID(), type: "Squidward", value: i))
                deck.append(Card(id: UUID(), type: "Patrick", value: i))
                deck.append(Card(id: UUID(), type: "Gary", value: i))
            }
            else if (i == 13) {
                deck.append(Card(id: UUID(), type: "Wild", value: i))
                deck.append(Card(id: UUID(), type: "Wild", value: i))
                deck.append(Card(id: UUID(), type: "Wild", value: i))
                deck.append(Card(id: UUID(), type: "Wild", value: i))
            }
            else {
                deck.append(Card(id: UUID(), type: "WildDrawFour", value: i))
                deck.append(Card(id: UUID(), type: "WildDrawFour", value: i))
                deck.append(Card(id: UUID(), type: "WildDrawFour", value: i))
                deck.append(Card(id: UUID(), type: "WildDrawFour", value: i))
            }
        }
    }
    
    // shuffle deck
    func shuffleDeck() {
        deck.shuffle()
    }
    
    // return a card and remove it from the deck
    func getCard() -> Card? {
        return deck.popLast()
    }
    
    // get deck size
    func getDeckSize() -> Int {
        return deck.endIndex
    }
    
    // reset the deck
    func resetDeck() {
        deck.removeAll()
    }
    
    // print the deck
    func printDeck() {
        for card in deck {
            print("\(card.type) \(card.value)")
        }
    }
}
