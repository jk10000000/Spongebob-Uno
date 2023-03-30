//
//  PlayerTurn.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 3/3/23.
//

import Foundation
import SwiftUI

// stores and updates player turn
class PlayerTurn: ObservableObject {
    
    @Published var turn: Int
    
    init() {
        turn = 1
    }
    
    func updateTurn(card: Card) {
        
        // reverse card - turn stays the same
        if (card.value == 11 && turn == 1) {
            turn = 1
        }
        else if (card.value == 11 && turn == 2) {
            turn = 2
        }
        
        // skip card - turn stays the same
        else if (card.value == 12 && turn == 1) {
            turn = 1
        }
        else if (card.value == 12 && turn == 2) {
            turn = 2
        }
        // wild card played - cant play card until a type choice is made
        else if ((card.value == 13 || card.value == 14) && turn == 1) {
            turn = 11
        }
        else if ((card.value == 13 || card.value == 14) && turn == 2) {
            turn = 12
        }
        else {
            if (turn == 1) {
                turn = 2
            }
            else {
                turn = 1
            }
        }
    }
    
    func reset() {
        turn = 1
    }
}
