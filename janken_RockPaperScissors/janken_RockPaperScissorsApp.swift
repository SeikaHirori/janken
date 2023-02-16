//
//  janken_RockPaperScissorsApp.swift
//  janken_RockPaperScissors
//
//  Created by Seika Hirori on 2/16/23.
//

import SwiftUI

@main
struct janken_RockPaperScissorsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


enum rockPaperScissors:Int, CaseIterable {
    case rock = 0
    case paper = 1
    case scissor = 2
}
