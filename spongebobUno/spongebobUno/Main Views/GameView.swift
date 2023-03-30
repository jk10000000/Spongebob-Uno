//
//  GameView.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 3/14/23.
//

import SwiftUI

// Displays the game view
struct GameView: View {
    
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
        VStack {
            Button(action: { start.toggle() }, label: { Text("Exit game").foregroundColor(Color.white).padding(10).background(Color.black).cornerRadius(15) })
            // Player 2 card display
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())], content: {
                    ForEach(Player2.playerCards) { card in
                        
                        Button(action: {
                            
                            // play a card and add it to the center
                            if (CanPlayCard(card: card) && playerTurn.turn == 2) {
                                playedCards.append(Player2.playCard(id: card.id))
                                // check for draw 2 card and wild draw 4
                                if (card.value == 10) {
                                    Player1.playerCards.append(deck.getCard()!)
                                    Player1.playerCards.append(deck.getCard()!)
                                }
                                else if (card.value == 14) {
                                    for _ in 0..<4 {
                                        Player1.playerCards.append(deck.getCard()!)
                                    }
                                }
                                // update player turn
                                playerTurn.updateTurn(card: card)
                                // check if player won
                                if (Player2.playerCards.isEmpty) {
                                    winner = "Player 2"
                                }
                            }
                        }, label: {
                            
                            CardView(card: card).padding(.leading, 10)
                            
                        })
                        
                    }
                })
            }
            .padding(.horizontal, 10)
            .frame(height: 160)
            Rectangle().frame(width: 200, height: 1)
            Text(playerTurn.turn == 2 || playerTurn.turn == 12 ? "Player 2 - Your turn" : "Player2")
            Spacer()
            HStack {
                // wild card is top card - display type selection
                if (playedCards.last?.value == 13 || playedCards.last?.value == 14) {
                    Spacer(minLength: (UIScreen.main.bounds.size.width / 2) - 180)
                    LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())], spacing: 3.0) {
                        ForEach(["Spongebob", "Squidward", "Patrick", "Gary"], id: \.self) { type in
                            Button(action: {
                                // add chosen card to stack
                                playedCards.append(Card(id: UUID(), type: type, value: 15))
                                // turn should be either 11 or 12 when wild card gets played - after type selection, update turn
                                if (playerTurn.turn == 11) { playerTurn.turn = 2 } else { playerTurn.turn = 1 }
                            }, label: {
                                if (type == "Spongebob") { Image("SpongebobHappy").resizable().frame(width: 50, height: 75).scaledToFit() }
                                else if (type == "Squidward") { Image("Squidward").resizable().frame(width: 50, height: 75).scaledToFit() }
                                else if (type == "Patrick") { Image("PatrickStar").resizable().frame(width: 50, height: 75).scaledToFit() }
                                else { Image("GaryTheSnail").resizable().frame(width: 50, height: 75).scaledToFit() }
                            }).cornerRadius(2).overlay(RoundedRectangle(cornerRadius: 2).stroke(.black, lineWidth: 1))
                        }
                    }.frame(height: 148)
                } else { Spacer(minLength: (UIScreen.main.bounds.size.width / 2) - 50) } // top card is not wild card
                
                // Displays played cards
                DeckDisplay(deck: playedCards)
                
                Spacer()
                
                // Draw pile - give the player a card
                Button(action: {
                    // Player1
                    if (playerTurn.turn == 1 && !deck.deck.isEmpty && !Player1.canPlayCard(playedCards: playedCards)) {
                        Player1.playerCards.append(deck.getCard()!)
                        // if the deck is now empty, reshuffle played cards (except top card) and put them in the draw pile
                        if (deck.deck.isEmpty) { resetDrawPile(playedCards: playedCards, deck: deck) }
                        // if player1 cannot play after drawing a card, change turns
                        if (!Player1.canPlayCard(playedCards: playedCards)) { playerTurn.turn = 2 }
                    }
                    // Player 2
                    else {
                        if (playerTurn.turn == 2 && !deck.deck.isEmpty && !Player2.canPlayCard(playedCards: playedCards)) {
                            Player2.playerCards.append(deck.getCard()!)
                            // if the deck is now empty, reshuffle played cards (except top card) and put them in the draw pile
                            if (deck.deck.isEmpty) { resetDrawPile(playedCards: playedCards, deck: deck) }
                            // if player2 cannot play after drawing a card, change turns
                            if (!Player2.canPlayCard(playedCards: playedCards)) { playerTurn.turn = 1 }
                        }
                    }
                }, label: {
                    if (playerTurn.turn == 1) {
                        Text("Draw card\n\(deck.getDeckSize()) cards remaining").foregroundColor(Player1.canPlayCard(playedCards: playedCards) ? Color.secondary : Color.black)
                    }
                    else if (playerTurn.turn == 2) {
                        Text("Draw card\n\(deck.getDeckSize()) cards remaining").foregroundColor(Player2.canPlayCard(playedCards: playedCards) ? Color.secondary : Color.black)
                    }
                    else {
                        Text("Draw card\n\(deck.getDeckSize()) cards remaining").foregroundColor(Color.secondary)
                    }
                })
                .padding(.trailing, 25)
                
            }
            Spacer()
            // Player 1 card display
            ScrollView(.horizontal) {
                
                LazyHGrid(rows: [GridItem(.flexible())], content: {
                    ForEach(Player1.playerCards) { card in
                        
                        Button(action: {
                            
                            // play card and add it to the center
                            if (CanPlayCard(card: card) && playerTurn.turn == 1) {
                                playedCards.append(Player1.playCard(id: card.id))
                                // check for draw 2 card and wild draw 4
                                if (card.value == 10) {
                                    Player2.playerCards.append(deck.getCard()!)
                                    Player2.playerCards.append(deck.getCard()!)
                                }
                                else if (card.value == 14) {
                                    for _ in 0..<4 {
                                        Player2.playerCards.append(deck.getCard()!)
                                    }
                                }
                                // update player turn
                                playerTurn.updateTurn(card: card)
                                // check if player won
                                if (Player1.playerCards.isEmpty) {
                                    winner = "Player 1"
                                }
                            }
                            
                            
                        }, label: {
                            
                            CardView(card: card).padding(.leading, 10)
                            
                        })
                        
                    }
                })
                
            }
            .padding(.horizontal, 10)
            .frame(height: 160)
            Rectangle().frame(width: 200, height: 1)
            Text(playerTurn.turn == 1 || playerTurn.turn == 11 ? "Player 1 - Your turn" : "Player 1")
        }
    }
    // checks whether a provided card can be played or not
    func CanPlayCard(card: Card) -> Bool {
        if (card.value == playedCards.last?.value || card.type == playedCards.last?.type && card.value < 13) {
            return true
        }
        else if (playedCards.last?.value == 15 && playedCards.last?.type == card.type) {
            return true
        }
        else {
            // playedCards.last!.value > 12 ||
            if (card.value > 12) { return true }
            else { return false }
        }
    }
    // take all except the top card from the played cards pile and shuffle, then add to deck/draw pile
    func resetDrawPile(playedCards: [Card], deck: CardClass) {
        for i in 0..<playedCards.count - 1 {
            deck.deck.append(playedCards[i])
            deck.shuffleDeck()
        }
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(start: $start, deckCreated: $start, playedCards: $playedCards, Player1: $Player1, Player2: $Player2, playerTurn: $playerTurn, deck: $deck)
//    }
//}
