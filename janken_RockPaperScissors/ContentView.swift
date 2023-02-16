//
//  ContentView.swift
//  janken_RockPaperScissors
//
//  Created by Seika Hirori on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentLanguage:[String] = ["グー (guu)","パー (paa)" ,"チョキ　(choki)"] // Default to Japanese on launch
    @State private var useEnglish:Bool = false
    
    @State private var app_RPS_choice: Int = 0 // CS #2
    @State private var playerWins: Bool = true // CS #2
    
    var body: some View {
        listRPS
    }
    
    // CS #1
    @ViewBuilder var listRPS: some View {
        VStack {
            ForEach(rockPaperScissors.allCases, id: \.self) {
                Text("\(currentLanguage[$0.rawValue])")}
                //            Button("\(currentLanguage[$0.rawValue])", action: )
                // TO-DO: Create button that has list of each item
            }
        }
    
    func switchLanguage() -> () {
        let englishRPS:[String] = ["Rock", "Paper", "Scissor"]
        let japaneseRPS:[String] = ["グー (guu)","パー (paa)" ,"チョキ　(choki)"]
        
        if useEnglish {
            currentLanguage = englishRPS
        } else {
            currentLanguage = japaneseRPS
        }
    }
    
//    func fightTime(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
