//
//  CardView.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 2/27/23.
//

import SwiftUI

// Creates an individual card

struct CardView: View {
    
    var card: Card
    
    var body: some View {
        ZStack {
            
            // Card type
            if (card.type == "Spongebob" && card.value < 10) {
                Image("SpongebobHappy").resizable().frame(width: 100, height: 150).scaledToFit()
            }
            else if (card.type == "Squidward" && card.value < 10) {
                Image("Squidward").resizable().frame(width: 100, height: 150).scaledToFit()
            }
            else if (card.type == "Patrick" && card.value < 10) {
                Image("PatrickStar").resizable().frame(width: 100, height: 150).scaledToFit()
            }
            else if (card.type == "Gary" && card.value < 10) {
                Image("GaryTheSnail").resizable().frame(width: 100, height: 150).scaledToFit()
            }
            // Draw two cards
            else if (card.type == "Spongebob" && card.value == 10) {
                Text("Spongebob Draw 2").frame(width: 100, height: 150)
            }
            else if (card.type == "Squidward" && card.value == 10) {
                Text("Squidward Draw 2").frame(width: 100, height: 150)
            }
            else if (card.type == "Patrick" && card.value == 10) {
                Text("Patrick Draw 2").frame(width: 100, height: 150)
            }
            else if (card.type == "Gary" && card.value == 10) {
                Text("Gary Draw 2").frame(width: 100, height: 150)
            }
            // Reverse cards
            else if (card.type == "Spongebob" && card.value == 11) {
                Text("Spongebob Reverse").frame(width: 100, height: 150)
            }
            else if (card.type == "Squidward" && card.value == 11) {
                Text("Squidward Reverse").frame(width: 100, height: 150)
            }
            else if (card.type == "Patrick" && card.value == 11) {
                Text("Patrick Reverse").frame(width: 100, height: 150)
            }
            else if (card.type == "Gary" && card.value == 11) {
                Text("Gary Reverse").frame(width: 100, height: 150)
            }
            // Skip cards
            else if (card.type == "Spongebob" && card.value == 12) {
                Text("Spongebob Skip").frame(width: 100, height: 150)
            }
            else if (card.type == "Squidward" && card.value == 12) {
                Text("Squidward Skip").frame(width: 100, height: 150)
            }
            else if (card.type == "Patrick" && card.value == 12) {
                Text("Patrick Skip").frame(width: 100, height: 150)
            }
            else if (card.type == "Gary" && card.value == 12) {
                Text("Gary Skip").frame(width: 100, height: 150)
            }
            // Wild cards
            else if (card.type == "Wild") {
                Text("Wild card").frame(width: 100, height: 150)
            }
            else if (card.type == "WildDrawFour") {
                Text("Wild Draw 4 card").frame(width: 100, height: 150)
            }
            // Wild choice cards
            else if (card.type == "Spongebob" && card.value == 15) {
                Image("SpongebobHappy").resizable().frame(width: 100, height: 150).scaledToFit()
            }
            else if (card.type == "Squidward" && card.value == 15) {
                Image("Squidward").resizable().frame(width: 100, height: 150).scaledToFit()
            }
            else if (card.type == "Patrick" && card.value == 15) {
                Image("PatrickStar").resizable().frame(width: 100, height: 150).scaledToFit()
            }
            else if (card.type == "Gary" && card.value == 15) {
                Image("GaryTheSnail").resizable().frame(width: 100, height: 150).scaledToFit()
            }
            // Top of draw pile
            else {
                Text("Draw Pile")
            }
            
            // Card value
            if (card.value != 15) {
                VStack {
                    HStack {
                        Spacer()
                        Text("\(card.value)").padding(.trailing, 10)
                    }
                    Spacer()
                    Text("\(card.value)").font(.system(size: 50)).italic()
                    Spacer()
                    HStack {
                        Text("\(card.value)").padding(.leading, 10)
                        Spacer()
                    }
                }
                .font(.system(size: 25)).foregroundColor(.white).shadow(color: .black, radius: 5)
            }
            
        }
        .frame(width: 100, height: 150)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 4))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: UUID(), type: "Spongebob", value: 1))
    }
}
