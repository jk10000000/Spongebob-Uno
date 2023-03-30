//
//  GameEndView.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 3/15/23.
//

import SwiftUI

// displays game winner screen
struct GameEndView: View {
    
    // Updates variables in Content View
    @Binding var start: Bool
    @Binding var deckCreated: Bool
    @Binding var playedCards: [Card]
    @Binding var winner: String
    @Binding var Player1: Player
    @Binding var Player2: Player
    @Binding var playerTurn: PlayerTurn
    @ObservedObject var deck: CardClass
    
    var body: some View {
        
        // Display winner
        ZStack {
            Image("SpongebobFlowers").resizable().scaledToFill().ignoresSafeArea()
            VStack {
                Text("\(winner) wins!")
                // Go to main menu and reset game (possibly add reset function)
                Button(action: {
                    winner = "NULL"
                    resetGame()
                    start.toggle()
                }, label: {
                    Text("Return to main menu")
                })
            }
        }
    }
    
    // resets game
    func resetGame() {
        Player1.resetCards()
        Player2.resetCards()
        playedCards.removeAll()
        deck.resetDeck()
        deckCreated = false
        playerTurn.reset()
    }
}

//struct GameEndView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameEndView(start: $start, deckCreated: $deckCreated, playedCards: $playedCards, winner: $winner, Player1: $Player1, Player2: $Player2, playerTurn: $playerTurn, deck: $deck)
//    }
//}
