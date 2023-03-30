//
//  DeckDisplay.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 3/2/23.
//

import SwiftUI

// Displays the most recently played card
struct DeckDisplay: View {
    
    // played cards array
    var deck: [Card]
    
    var body: some View {
        
        // Display the top card of the played cards
        if (!deck.isEmpty) {
            CardView(card: deck.last!)
        }
    }
}

struct DeckDisplay_Previews: PreviewProvider {
    static var previews: some View {
        DeckDisplay(deck: [Card(id: UUID(), type: "Spongebob", value: 1)])
    }
}
