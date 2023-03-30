//
//  spongebobUnoApp.swift
//  spongebobUno
//
//  Created by Josh Kirkpatrick on 2/22/23.
//

import SwiftUI

@main
struct spongebobUnoApp: App {
    
    @EnvironmentObject var deck: CardClass
    @EnvironmentObject var Player1: Player
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CardClass())
                .environmentObject(Player())
        }
    }
}
