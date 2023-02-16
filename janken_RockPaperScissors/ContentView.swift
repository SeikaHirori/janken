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
    
    @State private var app_RPS_choice: Int = Int.random(in: 0...2) // CS #2
    @State private var shouldPlayerWin: Bool = Bool.random() // CS #2
    
    var body: some View {
        listRPS
    }
    
    // CS #1
    var listRPS: some View {
        VStack {
            ForEach(rockPaperScissors.allCases, id: \.self) {
                let itemValue:String = "\(currentLanguage[$0.rawValue])"
                let rpsValue:Int = $0.rawValue
//                Text("DEBUG #\($0.rawValue): \(itemValue)")
//                    .padding()
                
                Button {
                    playerSelectChoice_fightTime(rpsValue)
                } label: {
                    Text("\(itemValue)")
                }
                .padding(30)
                
            }
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
    
    func playerSelectChoice_fightTime(_ choice:Int) {
        print("Choice #\(choice): \(currentLanguage[choice])")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
