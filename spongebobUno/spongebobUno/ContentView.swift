//
//  ContentView.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    
    // indicates whether a game has started or not
    @State var start = false
    // indicated whether a deck is made or not
    @State var deckCreated = false
    // Played cards
    @State var playedCards: [Card] = []
    // Winner
    @State var winner = "NULL"
    // Player, player turn, and card objects
    @State var Player1 = Player()
    @State var Player2 = Player()
    @State var playerTurn = PlayerTurn()
    @ObservedObject var deck = CardClass()
    
    var body: some View {
        
        // game started
        if start {
            // game in progress
            if (winner == "NULL") {
                GameView(start: $start, deckCreated: $deckCreated, playedCards: $playedCards, winner: $winner, Player1: $Player1, Player2: $Player2, playerTurn: $playerTurn, deck: deck).transition(.move(edge: .bottom))
            }
            // Game won
            else {
                // Display winner
                GameEndView(start: $start, deckCreated: $deckCreated, playedCards: $playedCards, winner: $winner, Player1: $Player1, Player2: $Player2, playerTurn: $playerTurn, deck: deck)
            }
//            Text("Game start")
        }
        // Main Manu
        else {
            MainMenu(start: $start, deckCreated: $deckCreated, playedCards: $playedCards, Player1: $Player1, Player2: $Player2, deck: deck).transition(.move(edge: .top))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
