//
//  MainMenu.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 3/3/23.
//

import SwiftUI

// Displays the Main Manu/Start Screen
struct MainMenu: View {
    
    // Updates variables in Content View
    @Binding var start: Bool
    @Binding var deckCreated: Bool
    @Binding var playedCards: [Card]
    @Binding var Player1: Player
    @Binding var Player2: Player
    @ObservedObject var deck: CardClass
    
    
    var body: some View {
        ZStack {
            Image("SpongebobFlowers").scaledToFill()
            VStack {
                Button(action: {
                    start.toggle()
                    if !deckCreated {
                        deck.createDeck()
                        deck.printDeck()
                        deck.shuffleDeck()
                        deckCreated = true
                        // add 7 cards to players hand
                        for _ in 0..<7 {
                            // Give players their cards
                            Player1.addCard(card: deck.getCard()!)
                            Player2.addCard(card: deck.getCard()!)
                            // Draw the first card
                            // Card can only be of value 0-9
                            playedCards.append(deck.deck.remove(at: deck.deck.firstIndex(where: { $0.value < 10})!))
                            
                        }
                        print("P1")
                        Player1.printCards()
                        print("P2")
                        Player2.printCards()
                    }
                }, label: {
                    Text("Start game").padding(16).foregroundColor(Color.white).background(.ultraThinMaterial).cornerRadius(15)
                })
            }
        }
        .padding()
    }
}

// Fix Later perhaps?
//struct MainMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMenu(start: false, deckCreated: false, playedCards: [], Player1: Player(), Player2: Player(), deck: CardClass())
//    }
//}
