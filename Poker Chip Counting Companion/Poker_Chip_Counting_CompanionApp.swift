//
//  Poker_Chip_Counting_CompanionApp.swift
//  Poker Chip Counting Companion
//
//  Created by Adish Patil on 10/9/22.
//

import SwiftUI

@main
struct Poker_Chip_Counting_CompanionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Data())
                .environmentObject(BLEManager())
//            MainView()
        }
    }
}
